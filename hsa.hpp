#ifndef HSA_HPP_INCLUDED
#define HSA_HPP_INCLUDED

// A C++ wrapper around a subset of the hsa api
#include "hsa.h"
#include "hsa_ext_amd.h"
#include <array>
#include <cstdio>
#include <unordered_map>
#include <vector>

#include <cassert>
#include <cstring>
#include <memory>
#include <string>
#include <type_traits>

#include <sys/mman.h>  // mmap and fstat
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

#include "find_metadata.hpp"
#include "hsa_packet.hpp"
#include "thirdparty/msgpack/msgpack.h"

// derived from llvm openmp runtime
namespace core
{
static hsa_status_t invoke_hsa_copy(hsa_signal_t sig, void* dest,
                                    const void* src, size_t size,
                                    hsa_agent_t agent)
{
  const hsa_signal_value_t init = 1;
  const hsa_signal_value_t success = 0;
  hsa_signal_store_screlease(sig, init);

  hsa_status_t err =
      hsa_amd_memory_async_copy(dest, agent, src, agent, size, 0, NULL, sig);
  if (err != HSA_STATUS_SUCCESS)
    {
      return err;
    }

  // async_copy reports success by decrementing and failure by setting to < 0
  hsa_signal_value_t got = init;
  while (got == init)
    {
      got = hsa_signal_wait_scacquire(sig, HSA_SIGNAL_CONDITION_NE, init,
                                      UINT64_MAX, HSA_WAIT_STATE_BLOCKED);
    }

  if (got != success)
    {
      return HSA_STATUS_ERROR;
    }

  return err;
}
}  // namespace core

namespace hsa
{
inline const char* status_string(hsa_status_t status)
{
  const char* res;
  if (hsa_status_string(status, &res) != HSA_STATUS_SUCCESS)
    {
      res = "unknown";
    }
  return res;
}

#define hsa_success_or_exit(status) \
  hsa::success_or_exit_impl(__LINE__, __FILE__, status)
inline void success_or_exit_impl(int line, const char* file,
                                 hsa_status_t status)
{
  if (status == HSA_STATUS_SUCCESS)
    {
      return;
    }
  fprintf(stderr, "HSA Failure at %s:%d (%u,%s)\n", file, line,
          (unsigned)status, status_string(status));
  exit(1);
}

struct init
{
  init() : status(hsa_init()) { hsa_success_or_exit(status); }
  ~init() { hsa_shut_down(); }
  const hsa_status_t status;
};

#if __cplusplus >= 201703L
#define requires_invocable_r(...) \
  static_assert(std::is_invocable_r<__VA_ARGS__>::value, "")
#else
#define requires_invocable_r(...) (void)0
#endif

template <typename C>
hsa_status_t iterate_agents(C cb)
{
  requires_invocable_r(hsa_status_t, C, hsa_agent_t);

  auto L = [](hsa_agent_t agent, void* data) -> hsa_status_t {
    C* unwrapped = static_cast<C*>(data);
    return (*unwrapped)(agent);
  };
  return hsa_iterate_agents(L, static_cast<void*>(&cb));
}

template <typename T, hsa_agent_info_t req>
struct agent_get_info
{
  static T call(hsa_agent_t agent)
  {
    T res;
    hsa_status_t r = hsa_agent_get_info(agent, req, static_cast<void*>(&res));
    (void)r;
    return res;
  }
};

template <hsa_agent_info_t req, typename e, size_t w>
struct agent_get_info<std::array<e, w>, req>
{
  using T = std::array<e, w>;
  static T call(hsa_agent_t agent)
  {
    T res;
    hsa_status_t rc =
        hsa_agent_get_info(agent, req, static_cast<void*>(res.data()));
    (void)rc;
    return res;
  }
};

inline std::array<char, 64> agent_get_info_name(hsa_agent_t agent)
{
  return agent_get_info<std::array<char, 64>, HSA_AGENT_INFO_NAME>::call(agent);
}

inline std::array<char, 64> agent_get_info_vendor_name(hsa_agent_t agent)
{
  return agent_get_info<std::array<char, 64>, HSA_AGENT_INFO_VENDOR_NAME>::call(
      agent);
}

inline hsa_agent_feature_t agent_get_info_feature(hsa_agent_t agent)
{
  return agent_get_info<hsa_agent_feature_t, HSA_AGENT_INFO_FEATURE>::call(
      agent);
}

inline uint32_t agent_get_info_queues_max(hsa_agent_t agent)
{
  return agent_get_info<uint32_t, HSA_AGENT_INFO_QUEUES_MAX>::call(agent);
}

inline uint32_t agent_get_info_queue_min_size(hsa_agent_t agent)
{
  return agent_get_info<uint32_t, HSA_AGENT_INFO_QUEUE_MIN_SIZE>::call(agent);
}

inline uint32_t agent_get_info_queue_max_size(hsa_agent_t agent)
{
  return agent_get_info<uint32_t, HSA_AGENT_INFO_QUEUE_MAX_SIZE>::call(agent);
}

inline hsa_queue_type32_t agent_get_info_queue_type(hsa_agent_t agent)
{
  return agent_get_info<hsa_queue_type32_t, HSA_AGENT_INFO_QUEUE_TYPE>::call(
      agent);
}

inline hsa_device_type_t agent_get_info_device(hsa_agent_t agent)
{
  return agent_get_info<hsa_device_type_t, HSA_AGENT_INFO_DEVICE>::call(agent);
}

inline std::array<uint8_t, 128> agent_get_info_extensions(hsa_agent_t agent)
{
  return agent_get_info<std::array<uint8_t, 128>,
                        HSA_AGENT_INFO_EXTENSIONS>::call(agent);
}

inline uint16_t agent_get_info_version_major(hsa_agent_t agent)
{
  return agent_get_info<uint16_t, HSA_AGENT_INFO_VERSION_MAJOR>::call(agent);
}

inline uint16_t agent_get_info_version_minor(hsa_agent_t agent)
{
  return agent_get_info<uint16_t, HSA_AGENT_INFO_VERSION_MINOR>::call(agent);
}

inline uint32_t agent_get_info_wavefront_size(hsa_agent_t agent)
{
  return agent_get_info<uint32_t, HSA_AGENT_INFO_WAVEFRONT_SIZE>::call(agent);
}

inline uint32_t agent_get_info_compute_unit_count(hsa_agent_t agent)
{
  return agent_get_info<
      uint32_t, static_cast<hsa_agent_info_t>(
                    HSA_AMD_AGENT_INFO_COMPUTE_UNIT_COUNT)>::call(agent);
}

inline uint32_t agent_get_info_num_simds_per_cu(hsa_agent_t agent)
{
  return agent_get_info<uint32_t,
                        static_cast<hsa_agent_info_t>(
                            HSA_AMD_AGENT_INFO_NUM_SIMDS_PER_CU)>::call(agent);
}

inline uint32_t agent_get_info_max_waves_per_cu(hsa_agent_t agent)
{
  return agent_get_info<uint32_t,
                        static_cast<hsa_agent_info_t>(
                            HSA_AMD_AGENT_INFO_MAX_WAVES_PER_CU)>::call(agent);
}

template <typename T, hsa_executable_symbol_info_t req>
struct symbol_get_info
{
  static T call(hsa_executable_symbol_t sym)
  {
    T res;
    hsa_status_t rc = hsa_executable_symbol_get_info(sym, req, &res);
    (void)rc;
    return res;
  }
};

inline hsa_symbol_kind_t symbol_get_info_type(hsa_executable_symbol_t sym)
{
  return symbol_get_info<hsa_symbol_kind_t,
                         HSA_EXECUTABLE_SYMBOL_INFO_TYPE>::call(sym);
}

inline uint32_t symbol_get_info_name_length(hsa_executable_symbol_t sym)
{
  return symbol_get_info<uint32_t,
                         HSA_EXECUTABLE_SYMBOL_INFO_NAME_LENGTH>::call(sym);
}

inline std::string symbol_get_info_name(hsa_executable_symbol_t sym)
{
  uint32_t size = symbol_get_info_name_length(sym);
  std::string res;
  res.resize(size + 1);

  hsa_status_t rc = hsa_executable_symbol_get_info(
      sym, HSA_EXECUTABLE_SYMBOL_INFO_NAME, static_cast<void*>(&res.front()));
  (void)rc;
  return res;
}

inline uint64_t symbol_get_info_variable_address(hsa_executable_symbol_t sym)
{
  // could assert that symbol kind is variable
  return symbol_get_info<
      uint64_t, HSA_EXECUTABLE_SYMBOL_INFO_VARIABLE_ADDRESS>::call(sym);
}

// The handle written to the kernel dispatch packet
inline uint64_t symbol_get_info_kernel_object(hsa_executable_symbol_t sym)
{
  return symbol_get_info<uint64_t,
                         HSA_EXECUTABLE_SYMBOL_INFO_KERNEL_OBJECT>::call(sym);
}

template <typename C>
hsa_status_t iterate_regions(hsa_agent_t agent, C cb)
{
  requires_invocable_r(hsa_status_t, C, hsa_region_t);

  auto L = [](hsa_region_t region, void* data) -> hsa_status_t {
    C* unwrapped = static_cast<C*>(data);
    return (*unwrapped)(region);
  };

  return hsa_agent_iterate_regions(agent, L, static_cast<void*>(&cb));
}

template <typename T, hsa_region_info_t req>
struct region_get_info
{
  static T call(hsa_region_t region)
  {
    T res;
    hsa_status_t r = hsa_region_get_info(region, req, static_cast<void*>(&res));
    (void)r;
    return res;
  }
};

#define REGION_GEN_INFO(suffix, type, req)                  \
  inline type region_get_info_##suffix(hsa_region_t region) \
  {                                                         \
    return region_get_info<type, req>::call(region);        \
  }

REGION_GEN_INFO(segment, hsa_region_segment_t, HSA_REGION_INFO_SEGMENT);
REGION_GEN_INFO(global_flags, hsa_region_global_flag_t,
                HSA_REGION_INFO_GLOBAL_FLAGS);
REGION_GEN_INFO(size, size_t, HSA_REGION_INFO_SIZE);
REGION_GEN_INFO(alloc_max_size, size_t, HSA_REGION_INFO_ALLOC_MAX_SIZE);
REGION_GEN_INFO(alloc_max_private_workgroup_size, uint32_t,
                HSA_REGION_INFO_ALLOC_MAX_PRIVATE_WORKGROUP_SIZE);
REGION_GEN_INFO(runtime_alloc_allowed, bool,
                HSA_REGION_INFO_RUNTIME_ALLOC_ALLOWED);
REGION_GEN_INFO(runtime_alloc_granule, size_t,
                HSA_REGION_INFO_RUNTIME_ALLOC_GRANULE);
REGION_GEN_INFO(runtime_alloc_alignment, size_t,
                HSA_REGION_INFO_RUNTIME_ALLOC_ALIGNMENT);

inline const char* enum_as_str(hsa_region_segment_t e)
{
  switch (e)
    {
      case HSA_REGION_SEGMENT_GLOBAL:
        return "HSA_REGION_SEGMENT_GLOBAL";
      case HSA_REGION_SEGMENT_READONLY:
        return "HSA_REGION_SEGMENT_READONLY";
      case HSA_REGION_SEGMENT_PRIVATE:
        return "HSA_REGION_SEGMENT_PRIVATE";
      case HSA_REGION_SEGMENT_GROUP:
        return "HSA_REGION_SEGMENT_GROUP";
      case HSA_REGION_SEGMENT_KERNARG:
        return "HSA_REGION_SEGMENT_KERNARG";
    }
  return "UNKNOWN SEGMENT";
}

inline const char* enum_as_str(hsa_region_global_flag_t e)
{
  switch ((int)e)
    {
      default:
        return "UNKNOWN MIX";
      case 0:
        return "HSA_REGION_GLOBAL_FLAG_NONE";
      case HSA_REGION_GLOBAL_FLAG_KERNARG:
        return "HSA_REGION_GLOBAL_FLAG_KERNARG";
      case HSA_REGION_GLOBAL_FLAG_FINE_GRAINED:
        return "HSA_REGION_GLOBAL_FLAG_FINE_GRAINED";
      case HSA_REGION_GLOBAL_FLAG_COARSE_GRAINED:
        return "HSA_REGION_GLOBAL_FLAG_COARSE_GRAINED";

      case (HSA_REGION_GLOBAL_FLAG_KERNARG |
            HSA_REGION_GLOBAL_FLAG_FINE_GRAINED):
        return "HSA_REGION_GLOBAL_FLAG_{KERNARG|FINE_GRAINED}";
      case (HSA_REGION_GLOBAL_FLAG_KERNARG |
            HSA_REGION_GLOBAL_FLAG_COARSE_GRAINED):
        return "HSA_REGION_GLOBAL_FLAG_{KERNARG|COARSE_GRAINED}";

      case (HSA_REGION_GLOBAL_FLAG_FINE_GRAINED |
            HSA_REGION_GLOBAL_FLAG_COARSE_GRAINED):
        return "HSA_REGION_GLOBAL_FLAG_{FINE_GRAINED|COARSE_GRAINED}";

      case (HSA_REGION_GLOBAL_FLAG_KERNARG |
            HSA_REGION_GLOBAL_FLAG_FINE_GRAINED |
            HSA_REGION_GLOBAL_FLAG_COARSE_GRAINED):
        return "HSA_REGION_GLOBAL_FLAG_{KERNARG|FINE_GRAINED|COARSE_GRAINED}";
    }
}

template <typename C>
hsa_status_t iterate_memory_pools(hsa_agent_t agent, C cb)
{
  requires_invocable_r(hsa_status_t, C, hsa_amd_memory_pool_t);
  auto L = [](hsa_amd_memory_pool_t pool, void* data) -> hsa_status_t {
    C* unwrapped = static_cast<C*>(data);
    return (*unwrapped)(pool);
  };
  return hsa_amd_agent_iterate_memory_pools(agent, L, static_cast<void*>(&cb));
};

// {nullptr} on failure

namespace detail
{
template <hsa_region_global_flag_t Flag>
inline hsa_region_t global_region_with_flag(hsa_agent_t agent)
{
  hsa_region_t result;
  hsa_status_t r =
      hsa::iterate_regions(agent, [&](hsa_region_t region) -> hsa_status_t {
        hsa_region_segment_t segment = hsa::region_get_info_segment(region);
        if (segment != HSA_REGION_SEGMENT_GLOBAL)
          {
            return HSA_STATUS_SUCCESS;
          }

        if (!hsa::region_get_info_runtime_alloc_allowed(region))
          {
            return HSA_STATUS_SUCCESS;
          }

        if (hsa::region_get_info_global_flags(region) & Flag)
          {
            result = region;
            return HSA_STATUS_INFO_BREAK;
          }

        return HSA_STATUS_SUCCESS;
      });
  if (r == HSA_STATUS_INFO_BREAK)
    {
      return result;
    }
  else
    {
      return {reinterpret_cast<uint64_t>(nullptr)};
    }
}
}  // namespace detail

inline hsa_region_t region_kernarg(hsa_agent_t agent)
{
  return detail::global_region_with_flag<HSA_REGION_GLOBAL_FLAG_KERNARG>(agent);
}

inline hsa_region_t region_fine_grained(hsa_agent_t agent)
{
  return detail::global_region_with_flag<HSA_REGION_GLOBAL_FLAG_FINE_GRAINED>(
      agent);
}

inline hsa_region_t region_coarse_grained(hsa_agent_t agent)
{
  return detail::global_region_with_flag<HSA_REGION_GLOBAL_FLAG_COARSE_GRAINED>(
      agent);
}

namespace detail
{
struct memory_deleter
{
  void operator()(void* data) { hsa_memory_free(data); }
};
}  // namespace detail
inline std::unique_ptr<void, detail::memory_deleter> allocate(
    hsa_region_t region, size_t size)
{
  void* res;
  // NB: hsa_memory_allocate is deprecated, should move to
  // hsa_amd_memory_pool_allocate with a fine grain pool
  hsa_status_t r = hsa_memory_allocate(region, size, &res);
  if (r == HSA_STATUS_SUCCESS)
    {
      return std::unique_ptr<void, detail::memory_deleter>(res);
    }
  else
    {
      return {nullptr};
    }
}

inline uint64_t sentinel() { return reinterpret_cast<uint64_t>(nullptr); }

struct kernel_info
{
  uint64_t private_segment_fixed_size = 0;
  uint64_t group_segment_fixed_size = 0;
};

inline std::unordered_map<std::string, kernel_info> parse_metadata(
    const void* binary, size_t binSize)
{
  // safely, if slowly, work around elf.h expecting mutable chars
  void* copy = malloc(binSize);
  assert(copy);
  memcpy(copy, binary, binSize);
  std::pair<unsigned char*, unsigned char*> metadata =
      find_metadata(copy, binSize);

  if (!metadata.first)
    {
      fprintf(stderr, "Failed to find metadata\n");
      exit(1);
    }

  msgpack::byte_range src{metadata.first, metadata.second};

  std::unordered_map<std::string, kernel_info> v;
  using namespace msgpack;
  foreach_map(src, [&](byte_range key, byte_range value) {
    if (!message_is_string(key, "amdhsa.kernels"))
      {
        return;
      }
    foreach_array(value, [&](byte_range element) {
      std::string symbol;
      kernel_info info;
      foreach_map(element, [&](byte_range key, byte_range value) {
        // msgpack doesn't mandate unique keys, could handle duplicates here
        if (message_is_string(key, ".symbol"))
          {
            foronly_string(value, [&](size_t N, const unsigned char* str) {
              symbol = std::string(str, str + N);
            });
          }
        else if (message_is_string(key, ".private_segment_fixed_size"))
          {
            foronly_unsigned(value, [&](uint64_t v) {
              info.private_segment_fixed_size = v;
            });
          }
        else if (message_is_string(key, ".group_segment_fixed_size"))
          {
            foronly_unsigned(
                value, [&](uint64_t v) { info.group_segment_fixed_size = v; });
          }
      });

      v[symbol] = info;
    });
  });

  free(copy);

  return v;
}

struct executable
{
  static const bool verbose = true;
  // hsa expects executable management to be quite dynamic
  // one can load multiple shared libraries, which can probably reference
  // symbols from each other. It supports 'executable_global_variable_define'
  // which names some previously allocated memory. Or readonly equivalent. This
  // wrapper is

  operator hsa_executable_t() { return state; }
  operator hsa_agent_t() { return agent; }

  bool valid() { return reinterpret_cast<void*>(state.handle) != nullptr; }

  ~executable()
  {
    hsa_executable_destroy(state);
    // reader needs to be destroyed after the executable
    hsa_code_object_reader_destroy(reader);

    if (mmapped_bytes != nullptr)
      {
        munmap(mmapped_bytes, mmapped_length);
      }
  }

  executable(hsa_agent_t agent, hsa_file_t file)
      : agent(agent), state({sentinel()})
  {
    // hsa_file_t is a POSIX file descriptor
    try_init_mmapped_bytes(file);
    if (mmapped_bytes == nullptr)
      {
        printf("mmap failed on file %d, aborting\n", file);
        exit(1);
      }

    info = parse_metadata(mmapped_bytes, mmapped_length);

    // This needs to be converted to mmap the file and delegate
    // in order to populate the kernel info table
    if (HSA_STATUS_SUCCESS == init_state())
      {
        if (HSA_STATUS_SUCCESS ==
            load_from_memory(mmapped_bytes, mmapped_length))
          {
            if (HSA_STATUS_SUCCESS == freeze_and_validate())
              {
                return;
              }
            else
              {
                if (verbose)
                  {
                    printf("executable: freeze_and_validate\n");
                  }
              }
          }
        else
          {
            if (verbose)
              {
                printf("executable: load_from_memory (%p, %zu) failed\n",
                       mmapped_bytes, mmapped_length);
              }
          }
      }
    else
      {
        if (verbose)
          {
            printf("executable: init_state failed\n");
          }
      }

    hsa_executable_destroy(state);
    state = {sentinel()};
  }

  executable(hsa_agent_t agent, const void* bytes, size_t size)
      : agent(agent), state({sentinel()}), info{parse_metadata(bytes, size)}
  {
    if (HSA_STATUS_SUCCESS == init_state())
      {
        if (verbose)
          {
            printf("executable: init success\n");
          }
        if (HSA_STATUS_SUCCESS == load_from_memory(bytes, size))
          {
            if (verbose)
              {
                printf("executable: load_from_memory success\n");
              }

            if (HSA_STATUS_SUCCESS == freeze_and_validate())
              {
                if (verbose)
                  {
                    printf("executable: freeze_and_validate\n");
                  }
                return;
              }
            else
              {
                if (verbose)
                  {
                    printf("executable: freeze failed\n");
                  }
              }
          }
        else
          {
            if (verbose)
              {
                printf("executable: load_from_memory (%p, %zu) failed\n", bytes,
                       size);
              }
          }
      }
    else
      {
        if (verbose)
          {
            printf("executable: init_state failed\n");
          }
      }
    hsa_executable_destroy(state);
    state = {sentinel()};
  }

  hsa_executable_symbol_t get_symbol_by_name(const char* symbol_name)
  {
    hsa_executable_symbol_t res;
    hsa_status_t rc =
        hsa_executable_get_symbol_by_name(state, symbol_name, &agent, &res);
    if (rc != HSA_STATUS_SUCCESS)
      {
        res = {sentinel()};
      }
    return res;
  }

  uint64_t get_symbol_address_by_name(const char* symbol_name)
  {
    hsa_executable_symbol_t symbol = get_symbol_by_name(symbol_name);
    if (symbol.handle == sentinel())
      {
        fprintf(stderr, "get_symbol_by_name failed on %s\n", symbol_name);
        return 0;
      }

    hsa_symbol_kind_t kind = hsa::symbol_get_info_type(symbol);
    if (kind == HSA_SYMBOL_KIND_VARIABLE)
      {
        return hsa::symbol_get_info_variable_address(symbol);
      }

    if (kind == HSA_SYMBOL_KIND_KERNEL)
      {
        return hsa::symbol_get_info_kernel_object(symbol);
      }

    fprintf(stderr, "get_symbol_address_by_name failed on %s, got kind %u\n",
            symbol_name, kind);
    return 0;
  }

  const std::unordered_map<std::string, kernel_info>& get_kernel_info()
  {
    return info;
  }

 private:
  hsa_status_t init_state()
  {
    hsa_profile_t profile =
        HSA_PROFILE_BASE;  // HIP uses full, vega claims 'base', unsure
    hsa_default_float_rounding_mode_t default_rounding_mode =
        HSA_DEFAULT_FLOAT_ROUNDING_MODE_DEFAULT;
    const char* options = 0;
    hsa_executable_t e;
    hsa_status_t rc =
        hsa_executable_create_alt(profile, default_rounding_mode, options, &e);
    if (rc == HSA_STATUS_SUCCESS)
      {
        state = e;
      }
    return rc;
  }

  void try_init_mmapped_bytes(hsa_file_t file)
  {
    mmapped_bytes = nullptr;
    {
      struct stat buf;
      int rc = fstat(file, &buf);
      if (rc == 0)
        {
          size_t l = buf.st_size;
          void* m = mmap(NULL, l, PROT_READ, MAP_PRIVATE, file, 0);
          if (m != MAP_FAILED)
            {
              mmapped_bytes = m;
              mmapped_length = l;
            }
        }
    }
  }

  hsa_status_t load_from_memory(const void* bytes, size_t size)
  {
    hsa_status_t rc =
        hsa_code_object_reader_create_from_memory(bytes, size, &reader);
    if (rc != HSA_STATUS_SUCCESS)
      {
        return rc;
      }

    hsa_loaded_code_object_t code;
    return hsa_executable_load_agent_code_object(state, agent, reader, NULL,
                                                 &code);
  }

  hsa_status_t freeze_and_validate()
  {
    {
      hsa_status_t rc = hsa_executable_freeze(state, NULL);
      if (rc != HSA_STATUS_SUCCESS)
        {
          return rc;
        }
    }

    {
      uint32_t vres;
      hsa_status_t rc = hsa_executable_validate(state, &vres);
      if (rc != HSA_STATUS_SUCCESS)
        {
          return rc;
        }

      if (vres != 0)
        {
          return HSA_STATUS_ERROR;
        }
    }
    return HSA_STATUS_SUCCESS;
  }

  // mmapped_bytes != nullptr iff using a mmap of a hsa_file_t
  void* mmapped_bytes = nullptr;
  size_t mmapped_length = 0;

  hsa_agent_t agent;
  hsa_executable_t state;
  std::unordered_map<std::string, kernel_info> info;
  hsa_code_object_reader_t reader;
};

inline hsa_agent_t find_a_gpu_or_exit()
{
  hsa_agent_t kernel_agent;
  if (HSA_STATUS_INFO_BREAK !=
      hsa::iterate_agents([&](hsa_agent_t agent) -> hsa_status_t {
        auto features = hsa::agent_get_info_feature(agent);
        if (features & HSA_AGENT_FEATURE_KERNEL_DISPATCH)
          {
            kernel_agent = agent;
            return HSA_STATUS_INFO_BREAK;
          }
        return HSA_STATUS_SUCCESS;
      }))
    {
      fprintf(stderr, "Failed to find a kernel agent\n");
      exit(1);
    }
  return kernel_agent;
}

inline std::vector<hsa_agent_t> find_gpus()
{
  std::vector<hsa_agent_t> result;
  if (HSA_STATUS_SUCCESS !=
      hsa::iterate_agents([&](hsa_agent_t agent) -> hsa_status_t {
        auto features = hsa::agent_get_info_feature(agent);
        if (features & HSA_AGENT_FEATURE_KERNEL_DISPATCH)
          {
            result.push_back(agent);
          }
        return HSA_STATUS_SUCCESS;
      }))
    {
      fprintf(stderr, "Fail while listing kernel agents\n");
      exit(1);
    }
  return result;
}

inline uint64_t acquire_available_packet_id(hsa_queue_t* queue)
{
  uint64_t packet_id = hsa_queue_add_write_index_relaxed(queue, 1);
  bool full = true;
  while (full)
    {
      full =
          packet_id >= (queue->size + hsa_queue_load_read_index_acquire(queue));
    }
  return packet_id;
}

inline void initialize_packet_defaults(uint32_t wavefront_size,
                                       hsa_kernel_dispatch_packet_t* packet)
{
  hsa_packet::initialize_packet_defaults(wavefront_size,
                                         (unsigned char*)packet);
}

inline hsa_queue_t* create_queue(hsa_agent_t kernel_agent,
                                 void (*callback)(hsa_status_t, hsa_queue_t*,
                                                  void*) = nullptr)
{
  hsa_queue_t* queue;

  hsa_status_t rc = hsa_queue_create(
      kernel_agent /* make the queue on this agent */,
      hsa::agent_get_info_queue_max_size(kernel_agent),
      HSA_QUEUE_TYPE_MULTI /* baseline */,
      callback /* called on every async event? */,
      nullptr /* data passed to previous */,
      // If sizes exceed these values, things are supposed to work slowly
      UINT32_MAX /* private_segment_size, 32_MAX is unknown */,
      UINT32_MAX /* group segment size, as above */, &queue);
  if (rc != HSA_STATUS_SUCCESS)
    {
      return nullptr;
    }
  return queue;
}

constexpr inline uint32_t packet_header(uint16_t header, uint16_t rest)
{
  return hsa_packet::packet_header(header, rest);
}

inline void packet_store_release(uint32_t* packet, uint16_t header,
                                 uint16_t rest)
{
  hsa_packet::packet_store_release(packet, header, rest);
}

constexpr inline uint16_t header(hsa_packet_type_t type, bool barrier = false)
{
  uint16_t header = type << HSA_PACKET_HEADER_TYPE;
  header |= (barrier ? 1 : 0) << HSA_PACKET_HEADER_BARRIER;
  header |= HSA_FENCE_SCOPE_SYSTEM << HSA_PACKET_HEADER_ACQUIRE_FENCE_SCOPE;
  header |= HSA_FENCE_SCOPE_SYSTEM << HSA_PACKET_HEADER_RELEASE_FENCE_SCOPE;
  return header;
}

constexpr inline uint16_t kernel_dispatch_setup()
{
  return 1 << HSA_KERNEL_DISPATCH_PACKET_SETUP_DIMENSIONS;
}

// kernarg, signal may be zero
inline void launch_kernel(uint32_t wavefront_size, uint64_t symbol_address,
                          uint32_t private_segment_fixed_size,
                          uint32_t group_segment_fixed_size, hsa_queue_t* queue,
                          uint64_t inline_argument, uint64_t kernarg_address,
                          hsa_signal_t completion_signal, bool barrier = false)
{
  const bool verbose = false;
  uint64_t packet_id = hsa::acquire_available_packet_id(queue);
  hsa_kernel_dispatch_packet_t* packet =
      (hsa_kernel_dispatch_packet_t*)queue->base_address +
      (packet_id & (queue->size - 1));
  hsa::initialize_packet_defaults(wavefront_size, packet);

  packet->kernel_object = symbol_address;
  packet->private_segment_size = private_segment_fixed_size;
  packet->group_segment_size = group_segment_fixed_size;

  memcpy(&packet->kernarg_address, &kernarg_address, 8);
  memcpy(&packet->completion_signal, &completion_signal, 8);

  // HSA marks this reserved, must be zero.
  // gfx9 passes the value through accurately, without error
  // will therefore use it as an implementation-defined arg slot
  // that may not be the case for packets launched from the gpu
  memcpy(&packet->reserved2, &inline_argument, 8);

  platform::fence_release();
  packet_store_release((uint32_t*)packet,
                       hsa::header(HSA_PACKET_TYPE_KERNEL_DISPATCH, barrier),
                       kernel_dispatch_setup());

#if 1
  char* doorbell_handle;
  __builtin_memcpy(&doorbell_handle, &queue->doorbell_signal.handle, 8);

  HOSTRPC_ATOMIC(uint64_t) * hardware_doorbell_ptr;
  __builtin_memcpy(&hardware_doorbell_ptr, doorbell_handle + 8,
                   sizeof(HOSTRPC_ATOMIC(uint64_t*)));

  if (verbose)
    {
      if (0)
        printf("Host: Using queue size %u at 0x%lx, writing to 0x%lx\n",
               queue->size, (uint64_t)queue->base_address, (uint64_t)packet);
      printf(
          "Launch kernel on packet_id %lu, db at 0x%lx, indir doorbell at "
          "0x%lx\n",
          packet_id, (uint64_t)doorbell_handle,
          (uint64_t)hardware_doorbell_ptr);

      hsa_packet::dump_kernel((unsigned char*)packet);
    }
#endif

  hsa_signal_store_release(queue->doorbell_signal, packet_id);
}

// kernarg, signal may be zero
inline int launch_kernel(hsa::executable& ex, hsa_queue_t* queue,
                         const char* kernel_entry, uint64_t inline_argument,
                         uint64_t kernarg_address,
                         hsa_signal_t completion_signal, bool barrier = false)
{
  uint64_t symbol_address = ex.get_symbol_address_by_name(kernel_entry);
  auto m = ex.get_kernel_info();
  auto it = m.find(std::string(kernel_entry));
  if (it == m.end() || symbol_address == 0)
    {
      fprintf(stderr, "Looking for symbol %s in kernel info, got address %lu\n",
              kernel_entry, symbol_address);
      return 1;
    }
  else
    {
      hsa_agent_t agent = ex;
      launch_kernel(hsa::agent_get_info_wavefront_size(agent), symbol_address,
                    (uint32_t)it->second.private_segment_fixed_size,
                    (uint32_t)it->second.group_segment_fixed_size, queue,
                    inline_argument, kernarg_address, completion_signal,
                    barrier);
      return 0;
    }
}

inline int call_nullary_kernel(hsa::executable& ex, hsa_queue_t* queue,
                               const char* kernel_entry, bool barrier = false)
{
  hsa_signal_t sig;
  hsa_status_t rc = hsa_signal_create(1, 0, 0, &sig);
  if (rc != HSA_STATUS_SUCCESS)
    {
      fprintf(stderr, "Failed to create signal\n");
      return 1;
    }

  int l = launch_kernel(ex, queue, kernel_entry, 0, 0, sig, barrier);
  if (l != 0)
    {
      fprintf(stderr, "Failed to launch kernel %s\n", kernel_entry);
      hsa_signal_destroy(sig);
      return l;
    }

  do
    {
    }
  while (hsa_signal_wait_acquire(sig, HSA_SIGNAL_CONDITION_EQ, 0, 5000,
                                 HSA_WAIT_STATE_ACTIVE) != 0);

  hsa_signal_destroy(sig);
  return 0;
}

inline int copy_host_to_gpu(hsa_agent_t agent, void* dst, const void* src,
                            size_t size)
{
  // memcpy works for gfx9, should see which is quicker. need this fallback for
  // gfx8
  // may want to copy via fine grain memory
  hsa_signal_t sig;
  hsa_status_t rc = hsa_signal_create(1, 0, 0, &sig);
  if (rc != HSA_STATUS_SUCCESS)
    {
      return 1;
    }

  rc = core::invoke_hsa_copy(sig, dst, src, size, agent);
  hsa_signal_destroy(sig);

  if (rc != HSA_STATUS_SUCCESS)
    {
      return 1;
    }

  return 0;
}

template <typename T>
int copy_host_to_gpu(hsa_agent_t agent, T* dst, const T* src)
{
  return hsa::copy_host_to_gpu(agent, reinterpret_cast<void*>(dst),
                               reinterpret_cast<const void*>(src), sizeof(T));
}

}  // namespace hsa

#endif
