<?xml version="1.0"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xml:output mode="xml" encoding="UTF-8"/>
 <xsl:param name="Now"/>
 <xsl:template match="/">
  <xsl:variable name="pubDate">
   <xsl:choose>
    <xsl:when test="channel/pubDate">
     <xsl:value-of select="channel/pubDate"/>
    </xsl:when>
    <xsl:when test="channel/lastBuildDate">
     <xsl:value-of select="channel/lastBuildDate"/>
    </xsl:when>
    <xsl:otherwise>
     <xsl:call-template name="convertToRfc822">
      <xsl:with-param name="Rfc3339Date">
       <xsl:value-of select="$Now"/>
      </xsl:with-param>
     </xsl:call-template>
    </xsl:otherwise>
   </xsl:choose>
  </xsl:variable>
  <xsl:element name="rss">
   <xsl:attribute name="version">2.0</xsl:attribute>
   <xsl:element name="channel">
    <xsl:element name="generator">
    </xsl:element>
    <xsl:element name="title">
     <xsl:value-of select="//*[name()='title']"/>
    </xsl:element>
    <xsl:element name="link">
     <xsl:value-of select="//*[name()='link']"/>
    </xsl:element>
    <xsl:element name="description">
     <xsl:value-of select="//*[name()='description']"/>
    </xsl:element>
    <xsl:element name="copyright">
     <xsl:value-of select="//*[name()='copyright']"/>
    </xsl:element>
    <xsl:element name="pubDate">
     <xsl:value-of select="$pubDate"/>
    </xsl:element>
    <xsl:if test="//*[name()='lastBuildDate']">
     <xsl:element name="lastBuildDate">
      <xsl:value-of select="//*[name()='lastBuildDate']"/>
     </xsl:element>
    </xsl:if>
    <xsl:call-template name="items">
     <xsl:with-param name="pubDate" select="$pubDate"/>
    </xsl:call-template>
   </xsl:element>
  </xsl:element>
 </xsl:template>
 <xsl:template name="items">
  <xsl:param name="pubDate"/>
  <xsl:for-each select="//*[name()='item']">
   <xsl:element name="item">
    <xsl:element name="title">
     <xsl:value-of select="child::*[name()='title']"/>
    </xsl:element>
    <xsl:element name="link">
     <xsl:value-of select="child::*[name()='link']"/>
    </xsl:element>
    <xsl:element name="guid">
     <xsl:value-of select="child::*[name()='link']"/>
    </xsl:element>
    <xsl:element name="category">
    </xsl:element>
    <xsl:element name="description">
     <xsl:value-of select="child::*[name()='description']"/>
    </xsl:element>
    <xsl:element name="pubDate">
     <xsl:value-of select="$pubDate"/>
    </xsl:element>
   </xsl:element>
  </xsl:for-each>
 </xsl:template>
 <xsl:template name="convertToRfc822">
  <xsl:param name="Rfc3339Date"/>
  <xsl:value-of select="substring($Rfc3339Date,9,2)"/>&#160;<xsl:call-template name="getMonth">
   <xsl:with-param name="month">
    <xsl:value-of select="substring($Rfc3339Date,6,2)"/>
   </xsl:with-param>
  </xsl:call-template>&#160;<xsl:value-of select="substring($Rfc3339Date,1,4)"/>&#160;<xsl:value-of select="substring($Rfc3339Date,12,8)"/>&#160;<xsl:call-template name="getTimeZone">
   <xsl:with-param name="timeSnippet">
    <xsl:value-of select="substring($Rfc3339Date,20)"/>
   </xsl:with-param>
  </xsl:call-template>
 </xsl:template>
 <xsl:template name="getMonth">
  <xsl:param name="month"/>
  <xsl:choose>
   <xsl:when test="$month = 1">Jan</xsl:when>
   <xsl:when test="$month = 2">Feb</xsl:when>
   <xsl:when test="$month = 3">Mar</xsl:when>
   <xsl:when test="$month = 4">Apr</xsl:when>
   <xsl:when test="$month = 5">May</xsl:when>
   <xsl:when test="$month = 6">Jun</xsl:when>
   <xsl:when test="$month = 7">Jul</xsl:when>
   <xsl:when test="$month = 8">Aug</xsl:when>
   <xsl:when test="$month = 9">Sep</xsl:when>
   <xsl:when test="$month = 10">Oct</xsl:when>
   <xsl:when test="$month = 11">Nov</xsl:when>
   <xsl:when test="$month = 12">Dec</xsl:when>
  </xsl:choose>
 </xsl:template>
 <xsl:template name="getTimeZone">
  <xsl:param name="timeSnippet"/>
  <xsl:param name="afterPlus" select="substring-after($timeSnippet, '+')"/>
  <xsl:param name="afterMinus" select="substring-after($timeSnippet, '-')"/>
  <xsl:choose>
   <xsl:when test="$afterPlus">
    +<xsl:value-of select="substring($afterPlus, 1, 2)"/>
    <xsl:value-of select="substring($afterPlus, 4, 2)"/>
   </xsl:when>
   <xsl:when test="$afterMinus">
    -<xsl:value-of select="substring($afterPlus, 1, 2)"/>
    <xsl:value-of select="substring($afterPlus, 4, 2)"/>
   </xsl:when>
   <xsl:when test="contains($timeSnippet,'Z')">Z</xsl:when>
  </xsl:choose>
 </xsl:template>
</xsl:stylesheet>
