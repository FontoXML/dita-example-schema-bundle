<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mathml="http://www.w3.org/1998/Math/MathML" xmlns:svg="http://www.w3.org/2000/svg" exclude-result-prefixes="mathml svg">
	<xsl:output method="xml" encoding="utf-8"/>
	
	<!-- Strip whitespace in all elements -->
	<xsl:strip-space elements="*"/>
	
	<!-- Except in all elements with mixed content -->
	<xsl:preserve-space elements="data unknown foreign title navtitle desc p note lq q sli li itemgroup dthd ddhd dt dd pre lines div text keyword term ph tm alt stentry draft-comment required-cleanup fn indexterm index-base cite xref dvrResourcePrefix dvrResourceSuffix dvrKeyscopePrefix dvrKeyscopeSuffix typeofhazard consequence howtoavoid b u i line-through overline tt sup sub index-see index-see-also index-sort-as shortdesc linktext searchtitle author source publisher copyrholder category prodname brand series platform prognum featnum component entry searchtitle shortdesc abstract bodydiv section sectiondiv example linktext linkinfo shape coords sort-as person organization summary printlocation revisionid year month day bookpartno edition isbn booknumber volume booklibrary mainbooktitle booktitlealt alt-text lcInstructornote2 lcQuestion2 lcOpenAnswer2 lcFeedback2 lcFeedbackCorrect2 lcFeedbackIncorrect2 lcAnswerContent2 lcItem2 lcMatchingItem2 lcAreaShape2 lcAreaCoords2 lcIntro lcObjectivesStem lcObjective lcAudience lcTime lcPrereqs lcSummary lcNextSteps lcReview lcResources lcChallenge lcInstruction lcInstructornote lcQuestion lcOpenAnswer lcFeedback lcFeedbackCorrect lcFeedbackIncorrect lcAnswerContent lcItem lcMatchingItem lcAreaShape lcAreaCoords lcInteractionLabel2 lcQuestionBase2 lcQuestionBase lomStructure lomCoverage lomAggregationLevel lomTechRequirement lomInstallationRemarks lomOtherPlatformRequirements lomInteractivityType lomLearningResourceType lomInteractivityLevel lomSemanticDensity lomIntendedUserRole lomContext lomTypicalAgeRange lomDifficulty lomTypicalLearningTime lcGeneralDescription lcGoals lcNeeds lcValues lcOrgConstraints lcEdLevel lcAge lcBackground lcSkills lcKnowledge lcMotivation lcSpecChars lcWorkEnvDescription lcPlanResources lcProcesses lcTaskItem lcAttitude lcPlanObjective lcJtaItem lcGapItemDelta lcLearnStrat lcAssessment lcDelivery equation-inline equation-block equation-number glossterm glossdef glossAbbreviation glossAcronym glossShortForm glossSynonym glossProperty glossSurfaceForm glossUsage glossScopeNote markupname codeph codeblock option var parmname synph oper delim sep apiname pt pd fragref synnote repsep kwd refsyn proptypehd propvaluehd propdeschd proptype propvalue propdesc change-person change-organization change-revisionid change-request-system change-request-id change-started change-completed change-summary msgph msgblock msgnum cmdname varname filepath userinput systemoutput prereq context steps-informal stepsection cmd info tutorialinfo stepxmp choice choptionhd chdeschd choption chdesc stepresult steptroubleshooting tasktroubleshooting result postreq reqcond reqcontp personnel perscat perskill esttime supequi supply spare safecond responsibleParty uicontrol wintitle shortcut screen numcharref parameterentity textentity xmlatt xmlelement xmlnsname xmlpi organizationname honorific firstname middlename lastname generationidentifier otherinfo addressdetails locality localityname administrativearea thoroughfare postalcode country contactnumber emailaddress url" />
	
	<xsl:variable name="mixed" select="'*year* *volume* *var* *url* *unknown* *typeofhazard* *title* *thoroughfare* *synnote* *summary* *source* *sli* *shortdesc* *shortdesc* *shortcut* *shape* *series* *sep* *searchtitle* *searchtitle* *screen* *revisionid* *responsibleParty* *repsep* *publisher* *pt* *propvalue* *proptype* *prognum* *prodname* *printlocation* *pre* *postalcode* *platform* *person* *p* *otherinfo* *organizationname* *organization* *oper* *navtitle* *msgblock* *month* *middlename* *mainbooktitle* *lomTypicalLearningTime* *lomTypicalAgeRange* *lomTechRequirement* *lomStructure* *lomSemanticDensity* *lomOtherPlatformRequirements* *lomLearningResourceType* *lomInteractivityType* *lomInteractivityLevel* *lomIntendedUserRole* *lomInstallationRemarks* *lomDifficulty* *lomCoverage* *lomContext* *lomAggregationLevel* *localityname* *locality* *linktext* *linktext* *lines* *lcWorkEnvDescription* *lcValues* *lcTime* *lcTaskItem* *lcSpecChars* *lcSkills* *lcQuestionBase* *lcQuestion* *lcProcesses* *lcPlanResources* *lcPlanObjective* *lcOrgConstraints* *lcOpenAnswer* *lcObjectivesStem* *lcObjective* *lcNeeds* *lcMotivation* *lcMatchingItem* *lcLearnStrat* *lcKnowledge* *lcJtaItem* *lcItem* *lcInteractionLabel2* *lcGoals* *lcGeneralDescription* *lcGapItemDelta* *lcFeedbackIncorrect* *lcFeedbackCorrect* *lcFeedback* *lcEdLevel* *lcDelivery* *lcBackground* *lcAttitude* *lcAssessment* *lcAreaShape2* *lcAreaShape* *lcAreaCoords2* *lcAreaCoords* *lcAnswerContent* *lcAge* *lastname* *kwd* *isbn* *index-sort-as* *index-see-also* *index-see* *index-base* *howtoavoid* *honorific* *glossterm* *glossSynonym* *glossSurfaceForm* *glossShortForm* *glossProperty* *glossAcronym* *glossAbbreviation* *generationidentifier* *fragref* *foreign* *firstname* *featnum* *equation-number* *equation-block* *emailaddress* *edition* *dvrResourceSuffix* *dvrResourcePrefix* *dvrKeyscopeSuffix* *dvrKeyscopePrefix* *dthd* *dt* *delim* *ddhd* *day* *data* *country* *copyrholder* *coords* *contactnumber* *consequence* *component* *codeblock* *cmd* *change-summary* *change-started* *change-revisionid* *change-request-system* *change-request-id* *change-person* *change-organization* *change-completed* *category* *brand* *booktitlealt* *bookpartno* *booknumber* *booklibrary* *author* *alt-text* *alt* *administrativearea* *addressdetails* *xref* *xmlpi* *xmlnsname* *xmlelement* *xmlatt* *wintitle* *varname* *userinput* *uicontrol* *u* *tt* *tm* *textentity* *text* *term* *systemoutput* *synph* *sup* *sub* *sort-as* *required-cleanup* *q* *ph* *parmname* *parameterentity* *overline* *option* *numcharref* *msgph* *msgnum* *markupname* *line-through* *keyword* *indexterm* *i* *fn* *filepath* *equation-inline* *draft-comment* *codeph* *cmdname* *cite* *b* *apiname*'"/>
	
	<xsl:variable name="inlineContaining"
		select="'*abstract* *body* *bodydiv* *cause* *chdesc* *chdeschd* *choice* *choption* *choptionhd* *conbody* *condition* *context* *dd* *desc* *div* *draft-comment* *entry* *equation-figure* *esttime* *example* *fig* *figgroup* *fn* *glossdef* *glossScopeNote* *glossUsage* *info* *itemgroup* *lcAnswerContent2* *lcAudience* *lcChallenge* *lcCIN* *lcClassroom* *lcClient* *lcConstraints* *lcDelivDate* *lcDownloadTime* *lcFeedback2* *lcFeedbackCorrect2* *lcFeedbackIncorrect2* *lcFileSizeLimitations* *lcGraphics* *lcHandouts* *lcInstruction* *lcInstructornote* *lcInstructornote2* *lcInteractionBase* *lcInteractionBase2* *lcIntro* *lcItem2* *lcLMS* *lcMatchingItem2* *lcModDate* *lcNextSteps* *lcNoLMS* *lcOJT* *lcOpenAnswer2* *lcPlanDescrip* *lcPlanPrereqs* *lcPlanSubject* *lcPlanTitle* *lcPlayers* *lcPrereqs* *lcQuestion2* *lcQuestionBase2* *lcResolution* *lcResources* *lcReview* *lcSecurity* *lcSummary* *lcViewers* *lcW3C* *li* *linkinfo* *lq* *note* *pd* *perscat* *perskill* *personnel* *postreq* *prereq* *propdesc* *propdeschd* *proptypehd* *propvaluehd* *refsyn* *reqcond* *reqcontp* *result* *safecond* *section* *sectiondiv* *spare* *stentry* *stepresult* *stepsection* *steps-informal* *steptroubleshooting* *stepxmp* *supequi* *supply* *tasktroubleshooting* *tutorialinfo*'"/>
	
	<xsl:variable name="inline"
		select="'*abbreviated-form* *apiname* *b* *boolean* *cite* *cmdname* *codeph* *draft-comment* *equation-inline* *filepath* *fn* *i* *indexterm* *indextermref* *keyword* *line-through* *markupname* *menucascade* *msgnum* *msgph* *numcharref* *option* *overline* *parameterentity* *parmname* *ph* *q* *required-cleanup* *sort-as* *state* *sub* *sup* *svg-container* *synph* *systemoutput* *term* *text* *textentity* *tm* *tt* *u* *uicontrol* *userinput* *varname* *wintitle* *xmlatt* *xmlelement* *xmlnsname* *xmlpi* *xref*'"/>
	
	<xsl:variable name="inlineWithImage"
		select="'*abbreviated-form* *apiname* *b* *boolean* *cite* *cmdname* *codeph* *data* *data-about* *draft-comment* *equation-inline* *filepath* *fn* *foreign* *i* *image* *indexterm* *indextermref* *keyword* *line-through* *markupname* *menucascade* *msgnum* *msgph* *numcharref* *option* *overline* *parameterentity* *parmname* *ph* *q* *required-cleanup* *sort-as* *state* *sub* *sup* *svg-container* *synph* *systemoutput* *term* *text* *textentity* *tm* *tt* *u* *uicontrol* *unknown* *userinput* *varname* *wintitle* *xmlatt* *xmlelement* *xmlnsname* *xmlpi* *xref* *mathml*'"/>
	
	<xsl:variable name="block"
		select="'*dl* *div* *fig* *lines* *lq* *note* *object* *ol* *pre* *simpletable* *sl* *table* *ul* *parml* *equation-block* *lcTrueFalse2* *lcSingleSelect2* *lcMultipleSelect2* *lcSequencing2* *lcMatching2* *lcHotspot2* *lcOpenQuestion2* *lcInteractionBase2* *imagemap* *syntaxdiagram* *equation-figure* *lcTrueFalse* *lcSingleSelect* *lcMultipleSelect* *lcSequencing* *lcMatching* *lcHotspot* *lcOpenQuestion* *lcInteractionBase* *hazardstatement* *lcInstructornote* *lcInstructornote2* *codeblock* *msgblock* *screen*'"/> <!-- image -->
	
	<xsl:template match="/" priority="1">
		<xsl:copy>
			<xsl:apply-templates select="node()[1]"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="*" priority="2">
		<xsl:choose>
			<xsl:when test="namespace-uri() = 'http://www.w3.org/1998/Math/MathML'">
				<xsl:element name="mathml:{local-name()}">
					<xsl:apply-templates select="@* | node()[1]"/>
				</xsl:element>
			</xsl:when>
			<xsl:when test="namespace-uri() = 'http://www.w3.org/2000/svg'">
				<xsl:element name="svg:{local-name()}">
					<xsl:apply-templates select="@* | node()[1]"/>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy>
					<xsl:apply-templates select="@* | node()[1]"/>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="following-sibling::node()[1]"/>
	</xsl:template>
	
	<xsl:template match="@*" priority="3">
		<xsl:if
			test="name()[not(contains(., 'ditaarch'))] and name() != 'class' and name() != 'domains'">
			<xsl:copy/>
		</xsl:if>
	</xsl:template>
	
	<!-- By default collapse to consecutive whitespace characters to a single space -->
	<xsl:template match="text()" priority="4">
		<xsl:choose>
			<xsl:when test="ancestor::pre or ancestor::msgblock or ancestor::codeblock or ancestor::screen">
				<xsl:copy/>
			</xsl:when>
			<xsl:when test="ancestor::lines">
				<xsl:variable name="trimWhitespaceExceptLineBreak">
					<xsl:value-of select="replace(., '[^\S\r\n]+', ' ', 'm')"/>
				</xsl:variable>
				<xsl:value-of select="replace($trimWhitespaceExceptLineBreak, '[^\S\r\n](\r|\n)[^\S\r\n]|(\r|\n)[^\S\r\n]|[^\S\r\n](\r|\n)', '&#x0A;', 'm')"/>
			</xsl:when>
			<xsl:when test="not(preceding-sibling::* or preceding-sibling::text()) and not(following-sibling::* or following-sibling::text()) 
				and parent::*[contains($mixed, concat('*', name(), '*')) and parent::*[not(contains($mixed, concat('*', name(), '*')))]]">
				<xsl:variable name="removeLeadingAndTrailingSpaces">
					<xsl:value-of select="replace(., '^\s+|\s+$', '', 'm')" />
				</xsl:variable>
				<xsl:value-of select="replace($removeLeadingAndTrailingSpaces, '\s+', ' ', 'm')" />
			</xsl:when>
			<xsl:when test="not(preceding-sibling::* or preceding-sibling::text()) 
				and parent::*[contains($mixed, concat('*', name(), '*')) and parent::*[not(contains($mixed, concat('*', name(), '*')))]]">
				<xsl:variable name="removeLeadingSpaces">
					<xsl:value-of select="replace(.,'^\s+','','m')" />
				</xsl:variable>
				<xsl:value-of select="replace($removeLeadingSpaces, '\s+', ' ', 'm')" />
			</xsl:when>
			<xsl:when test="not(following-sibling::* or following-sibling::text()) 
				and parent::*[contains($mixed, concat('*', name(), '*')) and parent::*[not(contains($mixed, concat('*', name(), '*')))]]">
				<xsl:variable name="removeTrailingSpaces">
					<xsl:value-of select="replace(., '\s+$', '', 'm')" />
				</xsl:variable>
				<xsl:value-of select="replace($removeTrailingSpaces, '\s+', ' ', 'm')" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="replace(., '\s+', ' ', 'm')" />
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="following-sibling::node()[1]"/>
	</xsl:template>
	
	<xsl:template match="comment() | processing-instruction()" priority="5">
		<xsl:copy/>
		<xsl:apply-templates select="following-sibling::node()[1]"/>
	</xsl:template>
	
	<xsl:template match="p[not(child::*[not(self::image)]) and count(child::image)=1 and not(child::text()[normalize-space(.)!=''])]" priority="6">
		<xsl:apply-templates select="node()[1]"/>
		<xsl:apply-templates select="following-sibling::node()[1]"/>
	</xsl:template>
	
	<xsl:template match="p[*[contains($block, concat('*', name(), '*'))]]" priority="7">
		<xsl:for-each select="child::node()">
			<xsl:choose>
				<xsl:when test="not(self::*) and not(self::text())">
					<xsl:if
						test="not(preceding-sibling::node()[not(self::comment() or self::processing-instruction())][1][(self::text() and normalize-space(.)!='') or contains($inlineWithImage, concat('*', name(), '*'))]) or (preceding-sibling::node()[not(self::comment() or self::processing-instruction())][1][(self::text() and normalize-space(.)!='') or contains($inlineWithImage, concat('*', name(), '*'))] and not(following-sibling::node()[not(self::comment() or self::processing-instruction())][1][(self::text() and normalize-space(.)!='') or contains($inlineWithImage, concat('*', name(), '*'))]))">
						<xsl:copy/>
					</xsl:if>
				</xsl:when>
				<xsl:when test="contains($block, concat('*', name(), '*'))">
					<xsl:copy>
						<xsl:apply-templates select="@* | node()[1]"/>
					</xsl:copy>
				</xsl:when>
				<xsl:when
					test="not(preceding-sibling::node()[not(self::comment() or self::processing-instruction())][1][(self::text() and normalize-space(.)!='') or contains($inlineWithImage, concat('*', name(), '*'))])">
					<xsl:if test="not(self::text()) or (self::text() and normalize-space(.)!='')">
						<xsl:variable name="paragraph">
							<p>
								<xsl:call-template name="nextInlineInP"/>
							</p>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="$paragraph/p[not(child::*[not(self::image)]) and count(child::image)=1 and not(child::text()[normalize-space(.)!=''])]">
								<xsl:apply-templates select="$paragraph/p/node()[1]"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:copy-of select="$paragraph"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
		<xsl:apply-templates select="following-sibling::node()[1]"/>
	</xsl:template>
	
	<xsl:template match="*[contains($block, concat('*', name(), '*'))][parent::p]" priority="8"/>
	
	<xsl:template
		match="*[contains($inlineContaining, concat('*', name(), '*'))]/*[contains($inline, concat('*', name(), '*'))] | *[contains($inlineContaining, concat('*', name(), '*'))]/text()"
		priority="9">
		<xsl:variable name="paragraph">
			<p>
				<xsl:call-template name="nextInline"/>
			</p>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$paragraph/p/node()[self::text() or self::*]">
				<xsl:copy-of select="$paragraph"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="$paragraph/p/node()[1]"/>
			</xsl:otherwise>
		</xsl:choose>
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
		name="nextInline"
		priority="10">
		<xsl:choose>
			<xsl:when test="self::*">
				<xsl:copy>
					<xsl:apply-templates select="@* | node()[1]"/>
				</xsl:copy>
			</xsl:when>
			<xsl:when test="self::text()">
				<xsl:choose>
					<xsl:when test="ancestor::pre or ancestor::msgblock or ancestor::codeblock or ancestor::screen">
						<xsl:copy/>
					</xsl:when>
					<xsl:when test="ancestor::lines">
						<xsl:variable name="trimWhitespaceExceptLineBreak">
							<xsl:value-of select="replace(., '[^\S\r\n]+', ' ', 'm')"/>
						</xsl:variable>
						<xsl:value-of select="replace($trimWhitespaceExceptLineBreak, '[^\S\r\n](\r|\n)[^\S\r\n]|(\r|\n)[^\S\r\n]|[^\S\r\n](\r|\n)', '&#x0A;', 'm')"/>
					</xsl:when>
					<xsl:when test="not(preceding-sibling::node()[not(self::comment() or self::processing-instruction())][1][self::text() or self::*[contains($inline, concat('*', name(), '*'))]]) and not(following-sibling::node()[not(self::comment() or self::processing-instruction())][1][self::text() or self::*[contains($inline, concat('*', name(), '*'))]])">
						<xsl:variable name="removeLeadingAndTrailingSpaces">
							<xsl:value-of select="replace(., '^\s+|\s+$', '', 'm')" />
						</xsl:variable>
						<xsl:value-of select="replace($removeLeadingAndTrailingSpaces, '\s+', ' ', 'm')" />
					</xsl:when>
					<xsl:when test="not(preceding-sibling::node()[not(self::comment() or self::processing-instruction())][1][self::text() or self::*[contains($inline, concat('*', name(), '*'))]])">
						<xsl:variable name="removeLeadingSpaces">
							<xsl:value-of select="replace(.,'^\s+','')" />
						</xsl:variable>
						<xsl:value-of select="replace($removeLeadingSpaces, '\s+', ' ', 'm')" />
					</xsl:when>
					<xsl:when test="not(following-sibling::node()[not(self::comment() or self::processing-instruction())][1][self::text() or self::*[contains($inline, concat('*', name(), '*'))]])">
						<xsl:variable name="removeTrailingSpaces">
							<xsl:value-of select="replace(., '\s+$', '', 'm')" />
						</xsl:variable>
						<xsl:value-of select="replace($removeTrailingSpaces, '\s+', ' ', 'm')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="replace(., '\s+', ' ', 'm')" />
					</xsl:otherwise>
				</xsl:choose>
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
		match="*[contains($inlineContaining, concat('*', name(), '*'))]/text()[preceding-sibling::node()[not(self::comment() or self::processing-instruction())][1][(self::text() and normalize-space(.)!='') or contains($inlineWithImage, concat('*', name(), '*'))]] | *[contains($inlineContaining, concat('*', name(), '*'))]/*[contains($inlineWithImage, concat('*', name(), '*'))][preceding-sibling::node()[not(self::comment() or self::processing-instruction())][1][(self::text() and normalize-space(.)!='') or contains($inlineWithImage, concat('*', name(), '*'))]] | p[*[contains($block, concat('*', name(), '*'))]]/text()[preceding-sibling::node()[not(self::comment() or self::processing-instruction())][1][(self::text() and normalize-space(.)!='') or contains($inlineWithImage, concat('*', name(), '*'))]] | p[*[contains($block, concat('*', name(), '*'))]]/*[contains($inlineWithImage, concat('*', name(), '*'))][preceding-sibling::node()[not(self::comment() or self::processing-instruction())][1][(self::text() and normalize-space(.)!='') or contains($inlineWithImage, concat('*', name(), '*'))]]"
		name="nextInlineInP" mode="nextInlineInP">
		<xsl:choose>
			<xsl:when test="self::*">
				<xsl:copy>
					<xsl:apply-templates select="@* | node()[1]"/>
				</xsl:copy>
			</xsl:when>
			<xsl:when test="self::text()">
				<xsl:choose>
					<xsl:when test="ancestor::pre or ancestor::msgblock or ancestor::codeblock or ancestor::screen">
						<xsl:copy/>
					</xsl:when>
					<xsl:when test="ancestor::lines">
						<xsl:variable name="trimWhitespaceExceptLineBreak">
							<xsl:value-of select="replace(., '[^\S\r\n]+', ' ', 'm')"/>
						</xsl:variable>
						<xsl:value-of select="replace($trimWhitespaceExceptLineBreak, '[^\S\r\n](\r|\n)[^\S\r\n]|(\r|\n)[^\S\r\n]|[^\S\r\n](\r|\n)', '&#x0A;', 'm')"/>
					</xsl:when>
					<xsl:when test="not(preceding-sibling::node()[not(self::comment() or self::processing-instruction())][1][self::text() or self::*[not(contains($block, concat('*', name(), '*')))]]) and not(following-sibling::node()[not(self::comment() or self::processing-instruction())][1][self::text() or self::*[not(contains($block, concat('*', name(), '*')))]])">
						<xsl:variable name="removeLeadingAndTrailingSpaces">
							<xsl:value-of select="replace(., '^\s+|\s+$', '', 'm')" />
						</xsl:variable>
						<xsl:value-of select="replace($removeLeadingAndTrailingSpaces, '\s+', ' ', 'm')" />
					</xsl:when>
					<xsl:when test="not(preceding-sibling::node()[not(self::comment() or self::processing-instruction())][1][self::text() or self::*[not(contains($block, concat('*', name(), '*')))]])">
						<xsl:variable name="removeLeadingSpaces">
							<xsl:value-of select="replace(.,'^\s+','')" />
						</xsl:variable>
						<xsl:value-of select="replace($removeLeadingSpaces, '\s+', ' ', 'm')" />
					</xsl:when>
					<xsl:when test="not(following-sibling::node()[not(self::comment() or self::processing-instruction())][1][self::text() or self::*[not(contains($block, concat('*', name(), '*')))]])">
						<xsl:variable name="removeTrailingSpaces">
							<xsl:value-of select="replace(., '\s+$', '', 'm')" />
						</xsl:variable>
						<xsl:value-of select="replace($removeTrailingSpaces, '\s+', ' ', 'm')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="replace(., '\s+', ' ', 'm')" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if
			test="following-sibling::node()[1][self::comment() or self::processing-instruction()][following-sibling::node()[not(self::comment() or self::processing-instruction())][1][(self::text() and normalize-space(.)!='') or contains($inlineWithImage, concat('*', name(), '*'))]]">
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
