#include "hsa/hsa.h"
#include "hsa/hsa_ext_amd.h"

#include <vector>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>

void guard(hsa_status_t s) {
  if (s != HSA_STATUS_SUCCESS) {
    fprintf(stderr, "Error %u\n", s);
    exit(1);
  }
}

namespace hsa {
template <typename T, hsa_agent_info_t req>
struct agent_get_info
{
  static T call(hsa_agent_t agent)
  {
    T res;
    hsa_status_t r = hsa_agent_get_info(agent, req, static_cast<void*>(&res));
    guard(r);
    return res;
  }
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

template <typename C>
hsa_status_t amd_agent_iterate_memory_pools(hsa_agent_t agent,
                                            C cb)
{
  requires_invocable_r(hsa_status_t, C, hsa_amd_memory_pool_t);

  auto L = [](hsa_amd_memory_pool_t agent, void* data) -> hsa_status_t {
    C* unwrapped = static_cast<C*>(data);
    return (*unwrapped)(agent);
  };

  return hsa_amd_agent_iterate_memory_pools(agent, L, static_cast<void*>(&cb));
}

  template <typename Ty>
  hsa_status_t getAttrRaw(hsa_amd_memory_pool_t Pool,
                          hsa_amd_memory_pool_info_t Kind,
                          Ty &Value) {
    return hsa_amd_memory_pool_get_info(Pool, Kind, &Value);
  }

inline hsa_agent_feature_t agent_get_info_feature(hsa_agent_t agent)
{
  return agent_get_info<hsa_agent_feature_t, HSA_AGENT_INFO_FEATURE>::call(
      agent);
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
      fprintf(stderr, "No region\n");
      exit(1);
    }
}
}  // namespace detail

  hsa_amd_memory_pool_t find_coarse_grain_global(hsa_agent_t agent)
  {
  hsa_amd_memory_pool_t out_pool;
  bool found = false;
  guard(hsa::amd_agent_iterate_memory_pools(agent,
                                            [&](hsa_amd_memory_pool_t Pool) -> hsa_status_t
                                            {
                                              if (found) { return HSA_STATUS_SUCCESS; }
                                              hsa_amd_segment_t Segment;
                                              uint32_t GlobalFlags = 0;
                                              guard(getAttrRaw(Pool, HSA_AMD_MEMORY_POOL_INFO_SEGMENT, Segment));

                                              guard(getAttrRaw(Pool, HSA_AMD_MEMORY_POOL_INFO_GLOBAL_FLAGS, GlobalFlags));

                                              bool isCoarse = GlobalFlags & HSA_AMD_MEMORY_POOL_GLOBAL_FLAG_COARSE_GRAINED;
                                              bool isGlobal = Segment == HSA_AMD_SEGMENT_GLOBAL;

                                              
                                              if (isCoarse & isGlobal) {
                                                found = true;
                                                out_pool = Pool;
                                              }

                                              return HSA_STATUS_SUCCESS;
                                            }));

  if (found) {
    return out_pool;
  } else {    
    exit(1);
  }
  }
    
  
inline hsa_region_t region_coarse_grained(hsa_agent_t agent)
{
  return detail::global_region_with_flag<HSA_REGION_GLOBAL_FLAG_COARSE_GRAINED>(
      agent);
}

  static hsa_status_t invoke_hsa_copy(void* dst, hsa_agent_t dst_agent,
                                      const void* src, hsa_agent_t src_agent,
                                      uint64_t size)
{

  hsa_signal_t sig;
  guard(hsa_signal_create(1, 0, 0, &sig));
  
  const hsa_signal_value_t init = 1;
  const hsa_signal_value_t success = 0;

  hsa_status_t err =
      hsa_amd_memory_async_copy(dst, dst_agent, src, src_agent, size, 0, NULL, sig);
  if (err != HSA_STATUS_SUCCESS)
    {
      fprintf(stderr, "async copy failed! return %u\n", err);
      exit(0);
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

  return HSA_STATUS_SUCCESS;
}

  
}

int main()
{
  guard(hsa_init());

  std::vector<hsa_agent_t> agents;
  
  guard(hsa::iterate_agents([&agents](hsa_agent_t agent) -> hsa_status_t
                            {
                              auto features = hsa::agent_get_info_feature(agent);
                              if (features & HSA_AGENT_FEATURE_KERNEL_DISPATCH) {
                                agents.push_back(agent);
                              }
                              return HSA_STATUS_SUCCESS;
                            }));

  if (agents.size() < 2) {
    fprintf(stderr, "Found %zu gpu agents, need two\n", agents.size());
    exit(0);
  }


  fprintf(stderr, "Found %zu gpu agents, using first two\n", agents.size());
  hsa_agent_t lhs = agents[0];
  hsa_agent_t rhs = agents[1];


  const uint64_t size = 4096/128;


                                            
  hsa_amd_memory_pool_t lhs_pool = hsa::find_coarse_grain_global(lhs);
  void * lhs_data;
  guard(hsa_amd_memory_pool_allocate(lhs_pool, size, 0, &lhs_data));

  hsa_amd_memory_pool_t rhs_pool = hsa::find_coarse_grain_global(rhs);
  void * rhs_data;
  guard(hsa_amd_memory_pool_allocate(rhs_pool, size, 0, &rhs_data));

  guard(hsa_amd_agents_allow_access(1, &lhs, NULL, rhs_data));
  guard(hsa_amd_agents_allow_access(1, &rhs, NULL, lhs_data));


  uint64_t * host_data = (uint64_t*)malloc(size);
  assert(host_data != nullptr);

  auto set_host = [&host_data](uint64_t d) {
                    for (unsigned i = 0; i < size/sizeof(uint64_t); i++) {
                      host_data[i] = d;
                    }
                  };

  // Check simple host<->gpu works

  const unsigned N = size/sizeof(uint64_t);

  set_host(1);
  for (unsigned i = 0; i < N; i++) {
    assert(host_data[i] == 1);
  }

  // write to lhs
  guard(hsa_memory_copy(lhs_data, host_data, size));
  
  set_host(0);  
  for (unsigned i = 0; i < N; i++) {
    assert(host_data[i] == 0);
  }

  // retrieve it
  guard(hsa_memory_copy(host_data, lhs_data, size));
  for (unsigned i = 0; i < N; i++) {
    assert(host_data[i] == 1);
  }


  // unary initialise rhs
  set_host(1);  
  guard(hsa_memory_copy(rhs_data, host_data, size));
  set_host(0);  
  // Check unary init worked
  guard(hsa_memory_copy(host_data, rhs_data, size));
  for (unsigned i = 0; i < N; i++) {
    assert(host_data[i] == 1);
  }
  
  // write a different number to lhs
  set_host(2);
  guard(hsa_memory_copy(lhs_data, host_data, size));

  // zero the host
  set_host(0);

  // Now host 0, rhs 1, lhs 2
  // async copy from lhs to rhs

  // send it to rhs
  hsa_status_t cp = hsa::invoke_hsa_copy(lhs_data, lhs, rhs_data, rhs, size);
  guard(cp);

  // retrieve it
  guard(hsa_memory_copy(host_data, rhs_data, size));
  for (unsigned i = 0; i < N; i++) {
    if (host_data[i] != 2) {
      fprintf(stderr, "Ith should be 2, is %lu\n", host_data[i]);
    }
  }


  free(host_data);
  hsa_memory_free(lhs_data);
  hsa_memory_free(rhs_data);

  guard(hsa_shut_down());
}
  
