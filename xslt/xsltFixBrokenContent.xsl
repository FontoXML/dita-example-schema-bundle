<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mathml="http://www.w3.org/1998/Math/MathML" xmlns:svg="http://www.w3.org/2000/svg" exclude-result-prefixes="mathml svg">
	<xsl:output method="xml" encoding="utf-8"/>
	
	<xsl:variable name="invalidTableParents" select="'*fn* *stentry* *entry* *proptypehd* *propvaluehd* *propdeschd* *choptionhd* *chdeschd* *choption* *chdesc*'"/>
	
	<xsl:variable name="invalidNoteParents" select="'*note* *lcInstructornote2* *lcInstructornote* *glossUsage* *glossScopeNote*'"/>
	
	<xsl:variable name="invalidTableAndFigureParents" select="'*figgroup* *fig* *lcInteractionBase* *lcClient* *lcPlanTitle* *lcCIN* *lcModDate* *lcDelivDate* *lcPlanSubject* *lcPlanDescrip* *lcPlanPrereqs* *lcLMS* *lcNoLMS* *lcHandouts* *lcClassroom* *lcOJT* *lcConstraints* *lcW3C* *lcPlayers* *lcGraphics* *lcViewers* *lcResolution* *lcFileSizeLimitations* *lcDownloadTime* *lcSecurity* *equation-figure*'"/>
	
	<xsl:variable name="invalidTableFigureAndObjectParents" select="'*desc* *linkinfo* *propdesc*'"/>
	
	<xsl:variable name="speacializationsOfFigure" select="'*imagemap* *syntaxdiagram* *equation-figure* *lcTrueFalse* *lcSingleSelect* *lcMultipleSelect* *lcSequencing* *lcMatching* *lcHotspot* *lcOpenQuestion* *lcInteractionBase*'"/>
	
	<xsl:template match="*">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="@* | text() | comment() | processing-instruction()">
		<xsl:copy/>
	</xsl:template>
	
	<!-- table and simpletable are not allowed in $invalidTableParents, $invalidTableAndFigureParents and $invalidTableFigureAndObjectParents -->
	<xsl:template match="*[(self::simpletable or self::table) and parent::*[contains($invalidTableParents, concat('*', name(), '*')) or contains($invalidTableAndFigureParents, concat('*', name(), '*')) or contains($invalidTableFigureAndObjectParents, concat('*', name(), '*'))]]">
		<xsl:text disable-output-escaping="yes">&lt;!--</xsl:text><xsl:copy>
			<xsl:apply-templates select="@* | node()" mode="copy"/>
		</xsl:copy><xsl:text disable-output-escaping="yes">--&gt;</xsl:text>
	</xsl:template>
	
	<!-- note and specializations of note are not allowed in $invalidNoteParents -->
	<xsl:template match="*[(self::note or self::hazardstatement or self::lcInstructornote or self::lcInstructornote2) and parent::*[contains($invalidNoteParents, concat('*', name(), '*'))]]">
		<xsl:text disable-output-escaping="yes">&lt;!--</xsl:text><xsl:copy>
			<xsl:apply-templates select="@* | node()" mode="copy"/>
		</xsl:copy><xsl:text disable-output-escaping="yes">--&gt;</xsl:text>
	</xsl:template>
	
	<!-- lq is not allowed in lq -->
	<xsl:template match="lq[parent::lq]">
		<xsl:text disable-output-escaping="yes">&lt;!--</xsl:text><xsl:copy>
			<xsl:apply-templates select="@* | node()" mode="copy"/>
		</xsl:copy><xsl:text disable-output-escaping="yes">--&gt;</xsl:text>
	</xsl:template>
	
	<!-- fig and figgroup are not allowed in $invalidTableAndFigureParents and $invalidTableFigureAndObjectParents -->
	<xsl:template match="*[(self::fig or self::figgroup or contains($speacializationsOfFigure, concat('*', name(), '*'))) and parent::*[contains($invalidTableAndFigureParents, concat('*', name(), '*')) or contains($invalidTableFigureAndObjectParents, concat('*', name(), '*'))]]">
		<xsl:text disable-output-escaping="yes">&lt;!--</xsl:text><xsl:copy>
			<xsl:apply-templates select="@* | node()" mode="copy"/>
		</xsl:copy><xsl:text disable-output-escaping="yes">--&gt;</xsl:text>
	</xsl:template>
	
	<!-- object is not allowed in $invalidTableFigureAndObjectParents -->
	<xsl:template match="object[parent::*[contains($invalidTableFigureAndObjectParents, concat('*', name(), '*'))]]">
		<xsl:text disable-output-escaping="yes">&lt;!--</xsl:text><xsl:copy>
			<xsl:apply-templates select="@* | node()" mode="copy"/>
		</xsl:copy><xsl:text disable-output-escaping="yes">--&gt;</xsl:text>
	</xsl:template>
	
	<xsl:template match="*" mode="copy">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"  mode="copy"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="@* | text() | comment() | processing-instruction()" mode="copy">
		<xsl:copy/>
	</xsl:template>
</xsl:stylesheet>
