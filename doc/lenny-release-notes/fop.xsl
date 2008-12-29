<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

  <xsl:import href="http://docbook.sourceforge.net/release/xsl/current/fo/docbook.xsl"/>

  <xsl:param name="l10n.gentext.language" select="'zh_cn'"/>

  <xsl:param name="draft.mode" select="no"/>

  <!-- These extensions are required for table printing and other stuff -->
  <xsl:param name="use.extensions">1</xsl:param>
  <xsl:param name="callouts.extension">1</xsl:param>
  <xsl:param name="linenumbering.extension">1</xsl:param>
  <xsl:param name="tablecolumns.extension">1</xsl:param>
  <xsl:param name="textinsert.extension">1</xsl:param>

  <xsl:param name="admon.graphics" select="1" />
  <xsl:param name="admon.graphics.extension">.png</xsl:param>
  <xsl:param name="callout.graphics" select="1" />
  <xsl:param name="callout.graphics.extension">.png</xsl:param>

  <xsl:param name="section.autolabel" select="1" />
  <xsl:param name="section.label.includes.component.label">1</xsl:param>

  <xsl:param name="fop.extensions">0</xsl:param>                <!-- fo only -->
  <xsl:param name="fop1.extensions">1</xsl:param>               <!-- fo only -->
  <xsl:param name="variablelist.as.blocks" select="1" />        <!-- fo only -->
  <xsl:param name="hyphenate">false</xsl:param>                 <!-- fo only -->
  <xsl:param name="paper.type" select="'A4'"></xsl:param>       <!-- fo only -->

  <!-- Chinese font related settings -->
  <xsl:param name="title.font.family">Arial,Calibri,sans-serif,zh_title</xsl:param>
  <xsl:param name="body.font.family">Times New Roman,Cambria,Cambria Math,serif,zh_text</xsl:param>
  <xsl:param name="sans.font.family">Arial,Calibri,sans-serif,zh_title</xsl:param>
  <xsl:param name="dingbat.font.family">Times New Roman,Cambria,Cambria Math,serif,zh_text</xsl:param>
  <xsl:param name="monospace.font.family">Courier New,monospace,zh_verbatim</xsl:param>
  <xsl:param name="symbol.font.family">Symbol,ZapfDingbats</xsl:param>

  <xsl:param name="title.fontset">Arial,Calibri,sans-serif,Symbol,ZapfDingbats,zh_title</xsl:param>
  <xsl:param name="body.fontset">Times New Roman,Cambria,Cambria Math,serif,Symbol,ZapfDingbats,zh_text</xsl:param>

  <xsl:param name="body.font.size">12</xsl:param>
  <xsl:param name="body.font.master">12</xsl:param>
  <xsl:param name="title.font.size">14</xsl:param>

  <!-- Page related Settings -->
  <xsl:param name="page.margin.inner">1.5cm</xsl:param>
  <xsl:param name="page.margin.outer">1.5cm</xsl:param>
  <xsl:param name="title.margin.left">0pt</xsl:param>
  <xsl:param name="body.start.indent">24pt</xsl:param>
  <xsl:param name="body.end.indent">0pt</xsl:param>

  <!-- Prevent blank pages in output -->
  <xsl:template name="book.titlepage.before.verso">
  </xsl:template>
  <xsl:template name="book.titlepage.verso">
  </xsl:template>
  <xsl:template name="book.titlepage.separator">
  </xsl:template>

  <!-- Colourize links in output -->
  <xsl:attribute-set name="xref.properties">
    <xsl:attribute name="color">
      <xsl:choose>
        <xsl:when test="self::ulink">blue</xsl:when>
        <xsl:when test="self::xref">blue</xsl:when>
        <xsl:when test="self::uri">blue</xsl:when>
        <xsl:otherwise>red</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="standard.para.spacing" use-attribute-sets="normal.para.spacing">
    <xsl:attribute name="text-indent">24pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:template match="section/para">
    <fo:block xsl:use-attribute-sets="standard.para.spacing">
      <xsl:call-template name="anchor"/>
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

</xsl:stylesheet>
