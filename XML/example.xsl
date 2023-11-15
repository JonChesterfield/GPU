<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text"/>
  <xsl:strip-space elements="*"/> 
<!--  <xsl:preserve-space elements="Implementation"/> -->



<!--  <xsl:template match="text()[not(normalize-space())]"/>  -->

  <xsl:template match="/">
    <!--
        Article - <xsl:value-of select="/Document/Title"/>
        Authors: <xsl:apply-templates select="/Document/Authors/Author"/>
        -->

    <xsl:apply-templates select="/Document"/>
  </xsl:template>

  <xsl:template match="Author">
    - <xsl:value-of select="." />
  </xsl:template>

  <xsl:template match="Title">
     <!-- <xsl:value-of select="." /> -->
  </xsl:template>

  
  <xsl:template match="Function">
    <xsl:text> - </xsl:text>
    <xsl:text> - </xsl:text>

    <xsl:value-of select="Return/Type"/>

    <xsl:value-of select="Name"/>

    <xsl:text>()</xsl:text>
    
    <xsl:text>   Wot function </xsl:text>

      
    <xsl:for-each select="Param">
      thing
    </xsl:for-each>

    

  </xsl:template>

  <xsl:template match="none">
    <xsl:value-of select="."/>
  </xsl:template>
  
</xsl:stylesheet>
