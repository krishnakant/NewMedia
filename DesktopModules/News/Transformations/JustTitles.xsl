﻿<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:param name="ItemsToShow"/>
  <xsl:param name="ShowItemDetails"/>
  <xsl:param name="ShowItemDate"/>
  <xsl:param name="Locale"/>
  <xsl:template match="rss">
    <xsl:for-each select="channel/item[position()&lt;=$ItemsToShow or $ItemsToShow&lt;1]">
      <p class="DNN_News_ItemLink">
        <a href="{link}" target="_main">
          <xsl:value-of select="title"/>
        </a>
      </p>
      <xsl:if test="$ShowItemDate='true'">
        <p class="DNN_News_ItemDate">
          <xsl:value-of select="pubDate"/>
        </p>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>