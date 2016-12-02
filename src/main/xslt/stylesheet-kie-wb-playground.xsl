<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://maven.apache.org/POM/4.0.0"
                xmlns:m="http://maven.apache.org/POM/4.0.0"
                exclude-result-prefixes="m"
                version="1.0">

  <!-- Copy the content of the pom.xml file -->
  <xsl:template match="node() | @*">
    <xsl:copy>
      <xsl:apply-templates select="node() | @*"/>
    </xsl:copy>
  </xsl:template>

  <!-- Remove parent & dependencies declarations -->
  <xsl:template match="m:parent"/>
  <xsl:template match="m:dependencies"/>

  <!-- Set version to 1.0.0-SNAPSHOT -->
  <xsl:template match="m:artifactId">
    <xsl:copy-of select="."/>
    <xsl:text>&#x0A;</xsl:text>
    <version>1.0.0-SNAPSHOT</version>
  </xsl:template>

</xsl:stylesheet>
