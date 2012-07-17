<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:param name="ControlID" />
	<xsl:param name="Options" />
	<xsl:param name="CSSClass" />
  <xsl:template match="/*">
    <xsl:apply-templates select="root" />
  </xsl:template>
  <xsl:template match="root">
		<script type="text/javascript">
      jQuery(function($) {
        var options = { initialIndex: -1 };
        $.extend(options, { <xsl:apply-templates select="node" mode="breadcrumb" /> }, <xsl:value-of select="$Options" />);
				  $("#<xsl:value-of select="$ControlID" />").tabs(".toolsaccordion div.pane", options);
			});
		</script>
		<div id="{$ControlID}" class="toolsaccordion">
			<xsl:apply-templates select="node" />
		</div>
	</xsl:template>
  <xsl:template match="node" mode="breadcrumb">
    <xsl:if test="@breadcrumb = 1">initialIndex: <xsl:value-of select="position() - 1" /></xsl:if>
  </xsl:template>
	<xsl:template match="node">
		<h3>
			<a href="{@url}">
				<xsl:value-of select="@text" />
			</a>
		</h3>
		<div class="pane">
			<xsl:apply-templates select="node" mode="sub">
				<xsl:with-param name="level" select="0" />
			</xsl:apply-templates>
		</div>
	</xsl:template>
	<xsl:template match="node" mode="sub">
		<xsl:param name="level" />
		<xsl:choose>
			<xsl:when test="@enabled = 0">
				<div>
					<xsl:call-template name="indent">
						<xsl:with-param name="level" select="$level" />
					</xsl:call-template>
					<xsl:value-of select="@text" />
				</div>
			</xsl:when>
			<xsl:otherwise>
				<a style="display:block" href="{@url}">
					<xsl:call-template name="indent">
						<xsl:with-param name="level" select="$level" />
					</xsl:call-template>
					<xsl:value-of select="@text" />
				</a>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="node" mode="sub">
			<xsl:with-param name="level" select="$level + 1" />
		</xsl:apply-templates>
	</xsl:template>
	<xsl:template name="indent">
		<xsl:param name="level" />
		<xsl:if test="$level &gt; 0">
			&#160;&#160;<xsl:call-template name="indent">
				<xsl:with-param name="level" select="$level - 1" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
