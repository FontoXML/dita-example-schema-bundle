<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" encoding="utf-8"/>
	
	<!-- Strip whitespace in all elements -->
	<xsl:strip-space elements="*"/>
	
	<!-- Except in all elements with mixed content -->
	<!-- TODO: should contain all elements which are mixed content after the contraints -->
	<xsl:preserve-space elements="p abbreviated-form apiname b boolean cite cmdname codeph draft-comment equation-inline filepath fn i indexterm indextermref keyword line-through markupname mathml menucascade msgnum msgph numcharref option overline parameterentity parmname ph q required-cleanup sort-as state sub sup svg-container synph systemoutput term text textentity tm tt u uicontrol userinput varname wintitle xmlatt xmlelement xmlnsname xmlpi xref"/>
	
	<xsl:variable name="inlineContaining"
		select="'*abstract* *body* *bodydiv* *cause* *chdesc* *chdeschd* *choice* *choption* *choptionhd* *conbody* *condition* *context* *dd* *desc* *div* *draft-comment* *entry* *equation-figure* *esttime* *example* *fig* *figgroup* *fn* *glossdef* *glossScopeNote* *glossUsage* *info* *itemgroup* *lcAnswerContent2* *lcAudience* *lcChallenge* *lcCIN* *lcClassroom* *lcClient* *lcConstraints* *lcDelivDate* *lcDownloadTime* *lcFeedback2* *lcFeedbackCorrect2* *lcFeedbackIncorrect2* *lcFileSizeLimitations* *lcGraphics* *lcHandouts* *lcInstruction* *lcInstructornote* *lcInstructornote2* *lcInteractionBase* *lcInteractionBase2* *lcIntro* *lcItem2* *lcLMS* *lcMatchingItem2* *lcModDate* *lcNextSteps* *lcNoLMS* *lcOJT* *lcOpenAnswer2* *lcPlanDescrip* *lcPlanPrereqs* *lcPlanSubject* *lcPlanTitle* *lcPlayers* *lcPrereqs* *lcQuestion2* *lcQuestionBase2* *lcResolution* *lcResources* *lcReview* *lcSecurity* *lcSummary* *lcViewers* *lcW3C* *li* *linkinfo* *lq* *note* *pd* *perscat* *perskill* *personnel* *postreq* *prereq* *propdesc* *propdeschd* *proptypehd* *propvaluehd* *refsyn* *reqcond* *reqcontp* *result* *safecond* *section* *sectiondiv* *spare* *stentry* *stepresult* *stepsection* *steps-informal* *steptroubleshooting* *stepxmp* *supequi* *supply* *tasktroubleshooting* *tutorialinfo*'"/>
	
	<xsl:variable name="inline"
		select="'*abbreviated-form* *apiname* *b* *boolean* *cite* *cmdname* *codeph* *draft-comment* *equation-inline* *filepath* *fn* *i* *indexterm* *indextermref* *keyword* *line-through* *markupname* *mathml* *menucascade* *msgnum* *msgph* *numcharref* *option* *overline* *parameterentity* *parmname* *ph* *q* *required-cleanup* *sort-as* *state* *sub* *sup* *svg-container* *synph* *systemoutput* *term* *text* *textentity* *tm* *tt* *u* *uicontrol* *userinput* *varname* *wintitle* *xmlatt* *xmlelement* *xmlnsname* *xmlpi* *xref*'"/>
	
	<xsl:variable name="inlineWithImage"
		select="'*abbreviated-form* *apiname* *b* *boolean* *cite* *cmdname* *codeph* *data* *data-about* *draft-comment* *equation-inline* *filepath* *fn* *foreign* *i* *image* *indexterm* *indextermref* *keyword* *line-through* *markupname* *mathml* *menucascade* *msgnum* *msgph* *numcharref* *option* *overline* *parameterentity* *parmname* *ph* *q* *required-cleanup* *sort-as* *state* *sub* *sup* *svg-container* *synph* *systemoutput* *term* *text* *textentity* *tm* *tt* *u* *uicontrol* *unknown* *userinput* *varname* *wintitle* *xmlatt* *xmlelement* *xmlnsname* *xmlpi* *xref*'"/>
	
	<xsl:variable name="block"
		select="'*dl* *div* *fig* *lines* *lq* *note* *object* *ol* *pre* *simpletable* *sl* *table* *ul* *parml* *equation-block* *lcTrueFalse2* *lcSingleSelect2* *lcMultipleSelect2* *lcSequencing2* *lcMatching2* *lcHotspot2* *lcOpenQuestion2* *lcInteractionBase2* *imagemap* *syntaxdiagram* *equation-figure* *lcTrueFalse* *lcSingleSelect* *lcMultipleSelect* *lcSequencing* *lcMatching* *lcHotspot* *lcOpenQuestion* *lcInteractionBase* *hazardstatement* *lcInstructornote* *lcInstructornote2* *codeblock* *msgblock* *screen*'"/> <!-- image -->
	
	<xsl:template match="/">
		<xsl:copy>
			<xsl:apply-templates select="node()[1]"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="*">
		<xsl:element name="{local-name()}">
			<xsl:apply-templates select="@* | node()[1]"/>
		</xsl:element>
		<xsl:apply-templates select="following-sibling::node()[1]"/>
	</xsl:template>
	
	<xsl:template match="@*">
		<xsl:if
			test="name()[not(contains(., 'ditaarch'))] and name() != 'class' and name() != 'domains'">
			<xsl:copy/>
		</xsl:if>
	</xsl:template>
	
	<!-- By default collapse to consecutive whitespace characters to a single space -->
	<!-- TODO: Except for pre (including specializations), see http://docs.oasis-open.org/dita/dita/v1.3/os/part3-all-inclusive/langRef/base/pre.html -->
	<!-- TODO: Except for lines (including specializations), see http://docs.oasis-open.org/dita/dita/v1.3/os/part3-all-inclusive/langRef/base/lines.html#lines -->
	<xsl:template match="text()">
		<xsl:value-of select="replace(., '(\s\s+)', ' ', 'm')" />
		<xsl:apply-templates select="following-sibling::node()[1]"/>
	</xsl:template>
	
	<xsl:template match="comment() | processing-instruction()">
		<xsl:copy/>
		<xsl:apply-templates select="following-sibling::node()[1]"/>
	</xsl:template>
	
	<xsl:template match="p[*[contains($block, concat('*', name(), '*'))]]">
		<xsl:for-each select="child::node()">
			<xsl:choose>
				<xsl:when test="not(self::*) and not(self::text())">
					<xsl:if
						test="not(preceding-sibling::node()[not(self::comment() or self::processing-instruction())][1][self::text() or contains($inlineWithImage, concat('*', name(), '*'))]) or (preceding-sibling::node()[not(self::comment() or self::processing-instruction())][1][self::text() or contains($inlineWithImage, concat('*', name(), '*'))] and not(following-sibling::node()[not(self::comment() or self::processing-instruction())][1][self::text() or contains($inlineWithImage, concat('*', name(), '*'))]))">
						<xsl:copy/>
					</xsl:if>
				</xsl:when>
				<xsl:when test="contains($block, concat('*', name(), '*'))">
					<xsl:element name="{local-name()}">
						<xsl:apply-templates select="@* | node()[1]"/>
					</xsl:element>
				</xsl:when>
				<xsl:when
					test="not(preceding-sibling::node()[not(self::comment() or self::processing-instruction())][1][self::text() or contains($inlineWithImage, concat('*', name(), '*'))])">
					<p>
						<xsl:call-template name="nextInlineInP"/>
					</p>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
		<xsl:apply-templates select="following-sibling::node()[1]"/>
	</xsl:template>
	
	<xsl:template match="*[contains($block, concat('*', name(), '*'))][parent::p]"/>
	
	<xsl:template
		match="*[contains($inlineContaining, concat('*', name(), '*'))]/*[contains($inline, concat('*', name(), '*'))] | *[contains($inlineContaining, concat('*', name(), '*'))]/text()">
		<p>
			<xsl:call-template name="nextInline"/>
		</p>
		<xsl:choose>
			<xsl:when
				test="following-sibling::node()[not(self::text() or self::comment() or self::processing-instruction() or contains($inline, concat('*', name(), '*')))][1][preceding-sibling::node()[1][self::comment() or self::processing-instruction()]]">
				<xsl:apply-templates
					select="following-sibling::node()[self::comment() or self::processing-instruction()][following-sibling::node()[not(self::comment() or self::processing-instruction())][1][not(self::text() or contains($inline, concat('*', name(), '*')))]][1]"
					mode="commentProcessing-instruction"/>
			</xsl:when>
			<xsl:when
				test="not(following-sibling::node()[not(self::text() or self::comment() or self::processing-instruction() or contains($inline, concat('*', name(), '*')))][1]) and following-sibling::node()[self::comment() or self::processing-instruction()][not(following-sibling::node())]">
				<xsl:apply-templates
					select="following-sibling::node()[self::comment() or self::processing-instruction()][not(following-sibling::node()[not(self::comment() or self::processing-instruction())])][1]"
					mode="commentProcessing-instruction"/>
			</xsl:when>
		</xsl:choose>
		<xsl:apply-templates
			select="following-sibling::node()[not(self::text() or self::comment() or self::processing-instruction() or contains($inline, concat('*', name(), '*')))][1]"
		/>
	</xsl:template>
	
	<xsl:template
		match="*[contains($inlineContaining, concat('*', name(), '*'))]/text()[preceding-sibling::node()[not(self::comment() or self::processing-instruction())][1][self::text() or contains($inline, concat('*', name(), '*'))]] | *[contains($inlineContaining, concat('*', name(), '*'))]/*[contains($inline, concat('*', name(), '*'))][preceding-sibling::node()[not(self::comment() or self::processing-instruction())][1][self::text() or contains($inline, concat('*', name(), '*'))]] | p[*[contains($block, concat('*', name(), '*'))]]/text()[preceding-sibling::node()[not(self::comment() or self::processing-instruction())][1][self::text() or contains($inline, concat('*', name(), '*'))]] | p[*[contains($block, concat('*', name(), '*'))]]/*[contains($inline, concat('*', name(), '*'))][preceding-sibling::node()[not(self::comment() or self::processing-instruction())][1][self::text() or contains($inline, concat('*', name(), '*'))]]"
		name="nextInline">
		<xsl:choose>
			<xsl:when test="self::*">
				<xsl:element name="{local-name()}">
					<xsl:apply-templates select="@* | node()[1]"/>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if
			test="following-sibling::node()[1][self::comment() or self::processing-instruction()][following-sibling::node()[not(self::comment() or self::processing-instruction())][1][self::text() or contains($inline, concat('*', name(), '*'))]]">
			<xsl:apply-templates
				select="following-sibling::node()[1][self::comment() or self::processing-instruction()]"
				mode="commentProcessing-instruction"/>
		</xsl:if>
		<xsl:apply-templates
			select="following-sibling::node()[not(self::comment() or self::processing-instruction())][1]/self::text() | following-sibling::node()[not(self::comment() or self::processing-instruction())][1][contains($inline, concat('*', name(), '*'))]"
		/>
	</xsl:template>
	
	<xsl:template
		match="*[contains($inlineContaining, concat('*', name(), '*'))]/text()[preceding-sibling::node()[not(self::comment() or self::processing-instruction())][1][self::text() or contains($inlineWithImage, concat('*', name(), '*'))]] | *[contains($inlineContaining, concat('*', name(), '*'))]/*[contains($inlineWithImage, concat('*', name(), '*'))][preceding-sibling::node()[not(self::comment() or self::processing-instruction())][1][self::text() or contains($inlineWithImage, concat('*', name(), '*'))]] | p[*[contains($block, concat('*', name(), '*'))]]/text()[preceding-sibling::node()[not(self::comment() or self::processing-instruction())][1][self::text() or contains($inlineWithImage, concat('*', name(), '*'))]] | p[*[contains($block, concat('*', name(), '*'))]]/*[contains($inlineWithImage, concat('*', name(), '*'))][preceding-sibling::node()[not(self::comment() or self::processing-instruction())][1][self::text() or contains($inlineWithImage, concat('*', name(), '*'))]]"
		name="nextInlineInP" mode="nextInlineInP">
		<xsl:choose>
			<xsl:when test="self::*">
				<xsl:element name="{local-name()}">
					<xsl:apply-templates select="@* | node()[1]"/>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if
			test="following-sibling::node()[1][self::comment() or self::processing-instruction()][following-sibling::node()[not(self::comment() or self::processing-instruction())][1][self::text() or contains($inlineWithImage, concat('*', name(), '*'))]]">
			<xsl:apply-templates
				select="following-sibling::node()[1][self::comment() or self::processing-instruction()]"
				mode="commentProcessing-instruction"/>
		</xsl:if>
		<xsl:apply-templates
			select="following-sibling::node()[not(self::comment() or self::processing-instruction())][1]/self::text() | following-sibling::node()[not(self::comment() or self::processing-instruction())][1][contains($inlineWithImage, concat('*', name(), '*'))]" mode="nextInlineInP"/>
	</xsl:template>
	
	<xsl:template match="comment() | processing-instruction()" mode="commentProcessing-instruction">
		<xsl:copy/>
		<xsl:if
			test="following-sibling::node()[1][self::comment() or self::processing-instruction()]">
			<xsl:apply-templates
				select="following-sibling::node()[1][self::comment() or self::processing-instruction()]"
				mode="commentProcessing-instruction"/>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
