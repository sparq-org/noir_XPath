//! Stub functions for unimplemented XPath functions.
//! These functions always assert false and will cause tests to fail
//! until the real implementation is provided.
//!
//! Note: Many previously stubbed functions now have real implementations.
//! See xpath_fn.nr and xpath_op.nr for the implemented function mappings.

/// Stub for fn:analyze-string - NOT YET IMPLEMENTED
pub fn stub_fnanalyze_string() -> bool {
    assert(false, "fn:analyze-string is not yet implemented");
    false
}

/// Stub for fn:apply - NOT YET IMPLEMENTED
pub fn stub_fnapply() -> bool {
    assert(false, "fn:apply is not yet implemented");
    false
}

/// Stub for fn:available-environment-variables - NOT YET IMPLEMENTED
pub fn stub_fnavailable_environment_variables() -> bool {
    assert(false, "fn:available-environment-variables is not yet implemented");
    false
}

/// Stub for fn:base-uri - NOT YET IMPLEMENTED
pub fn stub_fnbase_uri() -> bool {
    assert(false, "fn:base-uri is not yet implemented");
    false
}

/// Stub for fn:boolean - NOT YET IMPLEMENTED
/// Stub for fn:codepoints-to-string - NOT YET IMPLEMENTED
/// Stub for fn:collation-key - NOT YET IMPLEMENTED
pub fn stub_fncollation_key() -> bool {
    assert(false, "fn:collation-key is not yet implemented");
    false
}

/// Stub for fn:collection - NOT YET IMPLEMENTED
pub fn stub_fncollection() -> bool {
    assert(false, "fn:collection is not yet implemented");
    false
}

/// Stub for fn:concat - NOT YET IMPLEMENTED
/// Stub for fn:current-date - NOT YET IMPLEMENTED
pub fn stub_fncurrent_date() -> bool {
    assert(false, "fn:current-date is not yet implemented");
    false
}

/// Stub for fn:current-dateTime - NOT YET IMPLEMENTED
pub fn stub_fncurrent_datetime() -> bool {
    assert(false, "fn:current-dateTime is not yet implemented");
    false
}

/// Stub for fn:current-time - NOT YET IMPLEMENTED
pub fn stub_fncurrent_time() -> bool {
    assert(false, "fn:current-time is not yet implemented");
    false
}

/// Stub for fn:doc - NOT YET IMPLEMENTED
pub fn stub_fndoc() -> bool {
    assert(false, "fn:doc is not yet implemented");
    false
}

/// Stub for fn:doc-available - NOT YET IMPLEMENTED
pub fn stub_fndoc_available() -> bool {
    assert(false, "fn:doc-available is not yet implemented");
    false
}

/// Stub for fn:document-uri - NOT YET IMPLEMENTED
pub fn stub_fndocument_uri() -> bool {
    assert(false, "fn:document-uri is not yet implemented");
    false
}

/// Stub for fn:element-with-id - NOT YET IMPLEMENTED
pub fn stub_fnelement_with_id() -> bool {
    assert(false, "fn:element-with-id is not yet implemented");
    false
}

/// Stub for fn:encode-for-uri - NOT YET IMPLEMENTED
/// Stub for fn:environment-variable - NOT YET IMPLEMENTED
pub fn stub_fnenvironment_variable() -> bool {
    assert(false, "fn:environment-variable is not yet implemented");
    false
}

/// Stub for fn:error - NOT YET IMPLEMENTED
/// Stub for fn:escape-html-uri - NOT YET IMPLEMENTED
/// Stub for fn:filter - NOT YET IMPLEMENTED
pub fn stub_fnfilter() -> bool {
    assert(false, "fn:filter is not yet implemented");
    false
}

/// Stub for fn:fold-left - NOT YET IMPLEMENTED
pub fn stub_fnfold_left() -> bool {
    assert(false, "fn:fold-left is not yet implemented");
    false
}

/// Stub for fn:fold-right - NOT YET IMPLEMENTED
pub fn stub_fnfold_right() -> bool {
    assert(false, "fn:fold-right is not yet implemented");
    false
}

/// Stub for fn:for-each - NOT YET IMPLEMENTED
pub fn stub_fnfor_each() -> bool {
    assert(false, "fn:for-each is not yet implemented");
    false
}

/// Stub for fn:for-each-pair - NOT YET IMPLEMENTED
pub fn stub_fnfor_each_pair() -> bool {
    assert(false, "fn:for-each-pair is not yet implemented");
    false
}

/// Stub for fn:format-date - NOT YET IMPLEMENTED
pub fn stub_fnformat_date() -> bool {
    assert(false, "fn:format-date is not yet implemented");
    false
}

/// Stub for fn:format-dateTime - NOT YET IMPLEMENTED
pub fn stub_fnformat_datetime() -> bool {
    assert(false, "fn:format-dateTime is not yet implemented");
    false
}

/// Stub for fn:format-integer - NOT YET IMPLEMENTED
pub fn stub_fnformat_integer() -> bool {
    assert(false, "fn:format-integer is not yet implemented");
    false
}

/// Stub for fn:format-number - NOT YET IMPLEMENTED
pub fn stub_fnformat_number() -> bool {
    assert(false, "fn:format-number is not yet implemented");
    false
}

/// Stub for fn:format-time - NOT YET IMPLEMENTED
pub fn stub_fnformat_time() -> bool {
    assert(false, "fn:format-time is not yet implemented");
    false
}

/// Stub for fn:function-arity - NOT YET IMPLEMENTED
pub fn stub_fnfunction_arity() -> bool {
    assert(false, "fn:function-arity is not yet implemented");
    false
}

/// Stub for fn:function-lookup - NOT YET IMPLEMENTED
pub fn stub_fnfunction_lookup() -> bool {
    assert(false, "fn:function-lookup is not yet implemented");
    false
}

/// Stub for fn:function-name - NOT YET IMPLEMENTED
pub fn stub_fnfunction_name() -> bool {
    assert(false, "fn:function-name is not yet implemented");
    false
}

/// Stub for fn:generate-id - NOT YET IMPLEMENTED
pub fn stub_fngenerate_id() -> bool {
    assert(false, "fn:generate-id is not yet implemented");
    false
}

/// Stub for fn:has-children - NOT YET IMPLEMENTED
pub fn stub_fnhas_children() -> bool {
    assert(false, "fn:has-children is not yet implemented");
    false
}

/// Stub for fn:id - NOT YET IMPLEMENTED
pub fn stub_fnid() -> bool {
    assert(false, "fn:id is not yet implemented");
    false
}

/// Stub for fn:idref - NOT YET IMPLEMENTED
pub fn stub_fnidref() -> bool {
    assert(false, "fn:idref is not yet implemented");
    false
}

/// Stub for fn:in-scope-prefixes - NOT YET IMPLEMENTED
pub fn stub_fnin_scope_prefixes() -> bool {
    assert(false, "fn:in-scope-prefixes is not yet implemented");
    false
}

/// Stub for fn:innermost - NOT YET IMPLEMENTED
pub fn stub_fninnermost() -> bool {
    assert(false, "fn:innermost is not yet implemented");
    false
}

/// Stub for fn:iri-to-uri - NOT YET IMPLEMENTED
/// Stub for fn:json-doc - PARTIAL IMPLEMENTATION
/// Note: fn:json-doc requires URL loading which is not possible in ZK context.
/// Use JSON512b::parse_json_from_string() directly for JSON parsing.
pub fn stub_fnjson_doc() -> bool {
    assert(
        false,
        "fn:json-doc requires URL loading - use JSON512b::parse_json_from_string() instead",
    );
    false
}

/// Stub for fn:json-to-xml - NOT YET IMPLEMENTED
pub fn stub_fnjson_to_xml() -> bool {
    assert(false, "fn:json-to-xml is not yet implemented");
    false
}

/// Stub for fn:lang - NOT YET IMPLEMENTED
pub fn stub_fnlang() -> bool {
    assert(false, "fn:lang is not yet implemented");
    false
}

/// Stub for fn:last - NOT YET IMPLEMENTED
/// Stub for fn:load-xquery-module - NOT YET IMPLEMENTED
pub fn stub_fnload_xquery_module() -> bool {
    assert(false, "fn:load-xquery-module is not yet implemented");
    false
}

/// Stub for fn:local-name - NOT YET IMPLEMENTED
pub fn stub_fnlocal_name() -> bool {
    assert(false, "fn:local-name is not yet implemented");
    false
}

/// Stub for fn:local-name-from-QName - NOT YET IMPLEMENTED
/// Stub for fn:lower-case - NOT YET IMPLEMENTED
/// Stub for fn:matches - NOT YET IMPLEMENTED
pub fn stub_fnmatches() -> bool {
    assert(false, "fn:matches is not yet implemented");
    false
}

/// Stub for fn:matches.re - NOT YET IMPLEMENTED
pub fn stub_fnmatches_re() -> bool {
    assert(false, "fn:matches.re is not yet implemented");
    false
}

/// Stub for fn:name - NOT YET IMPLEMENTED
pub fn stub_fnname() -> bool {
    assert(false, "fn:name is not yet implemented");
    false
}

/// Stub for fn:namespace-uri - NOT YET IMPLEMENTED
pub fn stub_fnnamespace_uri() -> bool {
    assert(false, "fn:namespace-uri is not yet implemented");
    false
}

/// Stub for fn:namespace-uri-for-prefix - NOT YET IMPLEMENTED
pub fn stub_fnnamespace_uri_for_prefix() -> bool {
    assert(false, "fn:namespace-uri-for-prefix is not yet implemented");
    false
}

/// Stub for fn:namespace-uri-from-QName - NOT YET IMPLEMENTED
/// Stub for fn:nilled - NOT YET IMPLEMENTED
pub fn stub_fnnilled() -> bool {
    assert(false, "fn:nilled is not yet implemented");
    false
}

/// Stub for fn:node-name - NOT YET IMPLEMENTED
pub fn stub_fnnode_name() -> bool {
    assert(false, "fn:node-name is not yet implemented");
    false
}

/// Stub for fn:normalize-space - NOT YET IMPLEMENTED
/// Stub for fn:normalize-unicode - NOT YET IMPLEMENTED
pub fn stub_fnnormalize_unicode() -> bool {
    assert(false, "fn:normalize-unicode is not yet implemented");
    false
}

/// Stub for fn:number - NOT YET IMPLEMENTED
/// Stub for fn:outermost - NOT YET IMPLEMENTED
pub fn stub_fnoutermost() -> bool {
    assert(false, "fn:outermost is not yet implemented");
    false
}

/// Stub for fn:parse-ietf-date - NOT YET IMPLEMENTED
pub fn stub_fnparse_ietf_date() -> bool {
    assert(false, "fn:parse-ietf-date is not yet implemented");
    false
}

/// Stub for fn:parse-json - PARTIAL IMPLEMENTATION
/// Note: JSON parsing is available via JSON512b::parse_json_from_string() and similar type aliases.
/// This stub exists for XPath conformance tests that require the exact fn:parse-json signature.
pub fn stub_fnparse_json() -> bool {
    assert(false, "fn:parse-json - use JSON512b::parse_json_from_string() for JSON parsing");
    false
}

/// Stub for fn:parse-xml - NOT YET IMPLEMENTED
pub fn stub_fnparse_xml() -> bool {
    assert(false, "fn:parse-xml is not yet implemented");
    false
}

/// Stub for fn:parse-xml-fragment - NOT YET IMPLEMENTED
pub fn stub_fnparse_xml_fragment() -> bool {
    assert(false, "fn:parse-xml-fragment is not yet implemented");
    false
}

/// Stub for fn:path - NOT YET IMPLEMENTED
pub fn stub_fnpath() -> bool {
    assert(false, "fn:path is not yet implemented");
    false
}

/// Stub for fn:position - NOT YET IMPLEMENTED
/// Stub for fn:prefix-from-QName - NOT YET IMPLEMENTED
/// Stub for fn:random-number-generator - NOT YET IMPLEMENTED
pub fn stub_fnrandom_number_generator() -> bool {
    assert(false, "fn:random-number-generator is not yet implemented");
    false
}

/// Stub for fn:replace - NOT YET IMPLEMENTED
pub fn stub_fnreplace() -> bool {
    assert(false, "fn:replace is not yet implemented");
    false
}

/// Stub for fn:resolve-QName - NOT YET IMPLEMENTED
pub fn stub_fnresolve_qname() -> bool {
    assert(false, "fn:resolve-QName is not yet implemented");
    false
}

/// Stub for fn:resolve-uri - NOT YET IMPLEMENTED
pub fn stub_fnresolve_uri() -> bool {
    assert(false, "fn:resolve-uri is not yet implemented");
    false
}

/// Stub for fn:root - NOT YET IMPLEMENTED
pub fn stub_fnroot() -> bool {
    assert(false, "fn:root is not yet implemented");
    false
}

/// Stub for fn:serialize - NOT YET IMPLEMENTED
pub fn stub_fnserialize() -> bool {
    assert(false, "fn:serialize is not yet implemented");
    false
}

/// Stub for fn:static-base-uri - NOT YET IMPLEMENTED
pub fn stub_fnstatic_base_uri() -> bool {
    assert(false, "fn:static-base-uri is not yet implemented");
    false
}

/// Stub for fn:string-join - NOT YET IMPLEMENTED
/// Stub for fn:substring - NOT YET IMPLEMENTED
/// Stub for fn:substring-after - NOT YET IMPLEMENTED
/// Stub for fn:substring-before - NOT YET IMPLEMENTED
/// Stub for fn:trace - NOT YET IMPLEMENTED
/// Stub for fn:transform - NOT YET IMPLEMENTED
pub fn stub_fntransform() -> bool {
    assert(false, "fn:transform is not yet implemented");
    false
}

/// Stub for fn:translate - NOT YET IMPLEMENTED
/// Stub for fn:unparsed-text - NOT YET IMPLEMENTED
pub fn stub_fnunparsed_text() -> bool {
    assert(false, "fn:unparsed-text is not yet implemented");
    false
}

/// Stub for fn:unparsed-text-available - NOT YET IMPLEMENTED
pub fn stub_fnunparsed_text_available() -> bool {
    assert(false, "fn:unparsed-text-available is not yet implemented");
    false
}

/// Stub for fn:unparsed-text-lines - NOT YET IMPLEMENTED
pub fn stub_fnunparsed_text_lines() -> bool {
    assert(false, "fn:unparsed-text-lines is not yet implemented");
    false
}

/// Stub for fn:upper-case - NOT YET IMPLEMENTED
/// Stub for fn:xml-to-json - NOT YET IMPLEMENTED
pub fn stub_fnxml_to_json() -> bool {
    assert(false, "fn:xml-to-json is not yet implemented");
    false
}

/// Stub for op:bang - NOT YET IMPLEMENTED
pub fn stub_opbang() -> bool {
    assert(false, "op:bang is not yet implemented");
    false
}

/// Stub for op:concat - NOT YET IMPLEMENTED
pub fn stub_opconcat() -> bool {
    assert(false, "op:concat is not yet implemented");
    false
}

/// Stub for op:concatenate - NOT YET IMPLEMENTED
/// Stub for op:is-same-node - NOT YET IMPLEMENTED
pub fn stub_opis_same_node() -> bool {
    assert(false, "op:is-same-node is not yet implemented");
    false
}

/// Stub for op:node-after - NOT YET IMPLEMENTED
pub fn stub_opnode_after() -> bool {
    assert(false, "op:node-after is not yet implemented");
    false
}

/// Stub for op:node-before - NOT YET IMPLEMENTED
pub fn stub_opnode_before() -> bool {
    assert(false, "op:node-before is not yet implemented");
    false
}

/// Stub for op:same-key - NOT YET IMPLEMENTED
pub fn stub_opsame_key() -> bool {
    assert(false, "op:same-key is not yet implemented");
    false
}

/// Stub for prod:Annotation - NOT YET IMPLEMENTED
pub fn stub_prodannotation() -> bool {
    assert(false, "prod:Annotation is not yet implemented");
    false
}

/// Stub for prod:ArrayTest - NOT YET IMPLEMENTED
pub fn stub_prodarraytest() -> bool {
    assert(false, "prod:ArrayTest is not yet implemented");
    false
}

/// Stub for prod:ArrowPostfix - NOT YET IMPLEMENTED
pub fn stub_prodarrowpostfix() -> bool {
    assert(false, "prod:ArrowPostfix is not yet implemented");
    false
}

/// Stub for prod:AxisStep - NOT YET IMPLEMENTED
pub fn stub_prodaxisstep() -> bool {
    assert(false, "prod:AxisStep is not yet implemented");
    false
}

/// Stub for prod:AxisStep.abbr - NOT YET IMPLEMENTED
pub fn stub_prodaxisstep_abbr() -> bool {
    assert(false, "prod:AxisStep.abbr is not yet implemented");
    false
}

/// Stub for prod:AxisStep.ancestor - NOT YET IMPLEMENTED
pub fn stub_prodaxisstep_ancestor() -> bool {
    assert(false, "prod:AxisStep.ancestor is not yet implemented");
    false
}

/// Stub for prod:AxisStep.ancestor-or-self - NOT YET IMPLEMENTED
pub fn stub_prodaxisstep_ancestor_or_self() -> bool {
    assert(false, "prod:AxisStep.ancestor-or-self is not yet implemented");
    false
}

/// Stub for prod:AxisStep.following - NOT YET IMPLEMENTED
pub fn stub_prodaxisstep_following() -> bool {
    assert(false, "prod:AxisStep.following is not yet implemented");
    false
}

/// Stub for prod:AxisStep.following-sibling - NOT YET IMPLEMENTED
pub fn stub_prodaxisstep_following_sibling() -> bool {
    assert(false, "prod:AxisStep.following-sibling is not yet implemented");
    false
}

/// Stub for prod:AxisStep.preceding - NOT YET IMPLEMENTED
pub fn stub_prodaxisstep_preceding() -> bool {
    assert(false, "prod:AxisStep.preceding is not yet implemented");
    false
}

/// Stub for prod:AxisStep.preceding-sibling - NOT YET IMPLEMENTED
pub fn stub_prodaxisstep_preceding_sibling() -> bool {
    assert(false, "prod:AxisStep.preceding-sibling is not yet implemented");
    false
}

/// Stub for prod:AxisStep.unabbr - NOT YET IMPLEMENTED
pub fn stub_prodaxisstep_unabbr() -> bool {
    assert(false, "prod:AxisStep.unabbr is not yet implemented");
    false
}

/// Stub for prod:BaseURIDecl - NOT YET IMPLEMENTED
pub fn stub_prodbaseuridecl() -> bool {
    assert(false, "prod:BaseURIDecl is not yet implemented");
    false
}

/// Stub for prod:BoundarySpaceDecl - NOT YET IMPLEMENTED
pub fn stub_prodboundaryspacedecl() -> bool {
    assert(false, "prod:BoundarySpaceDecl is not yet implemented");
    false
}

/// Stub for prod:CastExpr - NOT YET IMPLEMENTED
pub fn stub_prodcastexpr() -> bool {
    assert(false, "prod:CastExpr is not yet implemented");
    false
}

/// Stub for prod:CastExpr.derived - NOT YET IMPLEMENTED
pub fn stub_prodcastexpr_derived() -> bool {
    assert(false, "prod:CastExpr.derived is not yet implemented");
    false
}

/// Stub for prod:CastExpr.schema - NOT YET IMPLEMENTED
pub fn stub_prodcastexpr_schema() -> bool {
    assert(false, "prod:CastExpr.schema is not yet implemented");
    false
}

/// Stub for prod:CastableExpr - NOT YET IMPLEMENTED
pub fn stub_prodcastableexpr() -> bool {
    assert(false, "prod:CastableExpr is not yet implemented");
    false
}

/// Stub for prod:Comment - NOT YET IMPLEMENTED
pub fn stub_prodcomment() -> bool {
    assert(false, "prod:Comment is not yet implemented");
    false
}

/// Stub for prod:CompAttrConstructor - NOT YET IMPLEMENTED
pub fn stub_prodcompattrconstructor() -> bool {
    assert(false, "prod:CompAttrConstructor is not yet implemented");
    false
}

/// Stub for prod:CompCommentConstructor - NOT YET IMPLEMENTED
pub fn stub_prodcompcommentconstructor() -> bool {
    assert(false, "prod:CompCommentConstructor is not yet implemented");
    false
}

/// Stub for prod:CompDocConstructor - NOT YET IMPLEMENTED
pub fn stub_prodcompdocconstructor() -> bool {
    assert(false, "prod:CompDocConstructor is not yet implemented");
    false
}

/// Stub for prod:CompElemConstructor - NOT YET IMPLEMENTED
pub fn stub_prodcompelemconstructor() -> bool {
    assert(false, "prod:CompElemConstructor is not yet implemented");
    false
}

/// Stub for prod:CompNamespaceConstructor - NOT YET IMPLEMENTED
pub fn stub_prodcompnamespaceconstructor() -> bool {
    assert(false, "prod:CompNamespaceConstructor is not yet implemented");
    false
}

/// Stub for prod:CompPIConstructor - NOT YET IMPLEMENTED
pub fn stub_prodcomppiconstructor() -> bool {
    assert(false, "prod:CompPIConstructor is not yet implemented");
    false
}

/// Stub for prod:CompTextConstructor - NOT YET IMPLEMENTED
pub fn stub_prodcomptextconstructor() -> bool {
    assert(false, "prod:CompTextConstructor is not yet implemented");
    false
}

/// Stub for prod:ConstructionDecl - NOT YET IMPLEMENTED
pub fn stub_prodconstructiondecl() -> bool {
    assert(false, "prod:ConstructionDecl is not yet implemented");
    false
}

/// Stub for prod:ConstructionDecl.schema - NOT YET IMPLEMENTED
pub fn stub_prodconstructiondecl_schema() -> bool {
    assert(false, "prod:ConstructionDecl.schema is not yet implemented");
    false
}

/// Stub for prod:ContextItemDecl - NOT YET IMPLEMENTED
pub fn stub_prodcontextitemdecl() -> bool {
    assert(false, "prod:ContextItemDecl is not yet implemented");
    false
}

/// Stub for prod:ContextItemExpr - NOT YET IMPLEMENTED
pub fn stub_prodcontextitemexpr() -> bool {
    assert(false, "prod:ContextItemExpr is not yet implemented");
    false
}

/// Stub for prod:CopyNamespacesDecl - NOT YET IMPLEMENTED
pub fn stub_prodcopynamespacesdecl() -> bool {
    assert(false, "prod:CopyNamespacesDecl is not yet implemented");
    false
}

/// Stub for prod:CountClause - NOT YET IMPLEMENTED
pub fn stub_prodcountclause() -> bool {
    assert(false, "prod:CountClause is not yet implemented");
    false
}

/// Stub for prod:CurlyArrayConstructor - NOT YET IMPLEMENTED
pub fn stub_prodcurlyarrayconstructor() -> bool {
    assert(false, "prod:CurlyArrayConstructor is not yet implemented");
    false
}

/// Stub for prod:DecimalFormatDecl - NOT YET IMPLEMENTED
pub fn stub_proddecimalformatdecl() -> bool {
    assert(false, "prod:DecimalFormatDecl is not yet implemented");
    false
}

/// Stub for prod:DefaultCollationDecl - NOT YET IMPLEMENTED
pub fn stub_proddefaultcollationdecl() -> bool {
    assert(false, "prod:DefaultCollationDecl is not yet implemented");
    false
}

/// Stub for prod:DefaultNamespaceDecl - NOT YET IMPLEMENTED
pub fn stub_proddefaultnamespacedecl() -> bool {
    assert(false, "prod:DefaultNamespaceDecl is not yet implemented");
    false
}

/// Stub for prod:DirAttributeList - NOT YET IMPLEMENTED
pub fn stub_proddirattributelist() -> bool {
    assert(false, "prod:DirAttributeList is not yet implemented");
    false
}

/// Stub for prod:DirElemConstructor - NOT YET IMPLEMENTED
pub fn stub_proddirelemconstructor() -> bool {
    assert(false, "prod:DirElemConstructor is not yet implemented");
    false
}

/// Stub for prod:DirElemContent - NOT YET IMPLEMENTED
pub fn stub_proddirelemcontent() -> bool {
    assert(false, "prod:DirElemContent is not yet implemented");
    false
}

/// Stub for prod:DirElemContent.namespace - NOT YET IMPLEMENTED
pub fn stub_proddirelemcontent_namespace() -> bool {
    assert(false, "prod:DirElemContent.namespace is not yet implemented");
    false
}

/// Stub for prod:DirElemContent.whitespace - NOT YET IMPLEMENTED
pub fn stub_proddirelemcontent_whitespace() -> bool {
    assert(false, "prod:DirElemContent.whitespace is not yet implemented");
    false
}

/// Stub for prod:DirectConstructor - NOT YET IMPLEMENTED
pub fn stub_proddirectconstructor() -> bool {
    assert(false, "prod:DirectConstructor is not yet implemented");
    false
}

/// Stub for prod:EQName - NOT YET IMPLEMENTED
pub fn stub_prodeqname() -> bool {
    assert(false, "prod:EQName is not yet implemented");
    false
}

/// Stub for prod:EmptyOrderDecl - NOT YET IMPLEMENTED
pub fn stub_prodemptyorderdecl() -> bool {
    assert(false, "prod:EmptyOrderDecl is not yet implemented");
    false
}

/// Stub for prod:ExtensionExpr - NOT YET IMPLEMENTED
pub fn stub_prodextensionexpr() -> bool {
    assert(false, "prod:ExtensionExpr is not yet implemented");
    false
}

/// Stub for prod:FLWORExpr - NOT YET IMPLEMENTED
pub fn stub_prodflworexpr() -> bool {
    assert(false, "prod:FLWORExpr is not yet implemented");
    false
}

/// Stub for prod:ForClause - NOT YET IMPLEMENTED
pub fn stub_prodforclause() -> bool {
    assert(false, "prod:ForClause is not yet implemented");
    false
}

/// Stub for prod:FunctionCall - NOT YET IMPLEMENTED
pub fn stub_prodfunctioncall() -> bool {
    assert(false, "prod:FunctionCall is not yet implemented");
    false
}

/// Stub for prod:FunctionDecl - NOT YET IMPLEMENTED
pub fn stub_prodfunctiondecl() -> bool {
    assert(false, "prod:FunctionDecl is not yet implemented");
    false
}

/// Stub for prod:GeneralComp.eq - NOT YET IMPLEMENTED
pub fn stub_prodgeneralcomp_eq() -> bool {
    assert(false, "prod:GeneralComp.eq is not yet implemented");
    false
}

/// Stub for prod:GeneralComp.ge - NOT YET IMPLEMENTED
pub fn stub_prodgeneralcomp_ge() -> bool {
    assert(false, "prod:GeneralComp.ge is not yet implemented");
    false
}

/// Stub for prod:GeneralComp.gt - NOT YET IMPLEMENTED
pub fn stub_prodgeneralcomp_gt() -> bool {
    assert(false, "prod:GeneralComp.gt is not yet implemented");
    false
}

/// Stub for prod:GeneralComp.le - NOT YET IMPLEMENTED
pub fn stub_prodgeneralcomp_le() -> bool {
    assert(false, "prod:GeneralComp.le is not yet implemented");
    false
}

/// Stub for prod:GeneralComp.lt - NOT YET IMPLEMENTED
pub fn stub_prodgeneralcomp_lt() -> bool {
    assert(false, "prod:GeneralComp.lt is not yet implemented");
    false
}

/// Stub for prod:GeneralComp.ne - NOT YET IMPLEMENTED
pub fn stub_prodgeneralcomp_ne() -> bool {
    assert(false, "prod:GeneralComp.ne is not yet implemented");
    false
}

/// Stub for prod:GroupByClause - NOT YET IMPLEMENTED
pub fn stub_prodgroupbyclause() -> bool {
    assert(false, "prod:GroupByClause is not yet implemented");
    false
}

/// Stub for prod:IfExpr - NOT YET IMPLEMENTED
pub fn stub_prodifexpr() -> bool {
    assert(false, "prod:IfExpr is not yet implemented");
    false
}

/// Stub for prod:InlineFunctionExpr - NOT YET IMPLEMENTED
pub fn stub_prodinlinefunctionexpr() -> bool {
    assert(false, "prod:InlineFunctionExpr is not yet implemented");
    false
}

/// Stub for prod:InstanceofExpr - NOT YET IMPLEMENTED
pub fn stub_prodinstanceofexpr() -> bool {
    assert(false, "prod:InstanceofExpr is not yet implemented");
    false
}

/// Stub for prod:LetClause - NOT YET IMPLEMENTED
pub fn stub_prodletclause() -> bool {
    assert(false, "prod:LetClause is not yet implemented");
    false
}

/// Stub for prod:Literal - NOT YET IMPLEMENTED
pub fn stub_prodliteral() -> bool {
    assert(false, "prod:Literal is not yet implemented");
    false
}

/// Stub for prod:Lookup - NOT YET IMPLEMENTED
pub fn stub_prodlookup() -> bool {
    assert(false, "prod:Lookup is not yet implemented");
    false
}

/// Stub for prod:MapConstructor - NOT YET IMPLEMENTED
pub fn stub_prodmapconstructor() -> bool {
    assert(false, "prod:MapConstructor is not yet implemented");
    false
}

/// Stub for prod:MapTest - NOT YET IMPLEMENTED
pub fn stub_prodmaptest() -> bool {
    assert(false, "prod:MapTest is not yet implemented");
    false
}

/// Stub for prod:ModuleImport - NOT YET IMPLEMENTED
pub fn stub_prodmoduleimport() -> bool {
    assert(false, "prod:ModuleImport is not yet implemented");
    false
}

/// Stub for prod:NameTest - NOT YET IMPLEMENTED
pub fn stub_prodnametest() -> bool {
    assert(false, "prod:NameTest is not yet implemented");
    false
}

/// Stub for prod:NamedFunctionRef - NOT YET IMPLEMENTED
pub fn stub_prodnamedfunctionref() -> bool {
    assert(false, "prod:NamedFunctionRef is not yet implemented");
    false
}

/// Stub for prod:NamespaceDecl - NOT YET IMPLEMENTED
pub fn stub_prodnamespacedecl() -> bool {
    assert(false, "prod:NamespaceDecl is not yet implemented");
    false
}

/// Stub for prod:NodeTest - NOT YET IMPLEMENTED
pub fn stub_prodnodetest() -> bool {
    assert(false, "prod:NodeTest is not yet implemented");
    false
}

/// Stub for prod:OptionDecl - NOT YET IMPLEMENTED
pub fn stub_prodoptiondecl() -> bool {
    assert(false, "prod:OptionDecl is not yet implemented");
    false
}

/// Stub for prod:OptionDecl.serialization - NOT YET IMPLEMENTED
pub fn stub_prodoptiondecl_serialization() -> bool {
    assert(false, "prod:OptionDecl.serialization is not yet implemented");
    false
}

/// Stub for prod:OrExpr - NOT YET IMPLEMENTED
pub fn stub_prodorexpr() -> bool {
    assert(false, "prod:OrExpr is not yet implemented");
    false
}

/// Stub for prod:OrderByClause - NOT YET IMPLEMENTED
pub fn stub_prodorderbyclause() -> bool {
    assert(false, "prod:OrderByClause is not yet implemented");
    false
}

/// Stub for prod:OrderingModeDecl - NOT YET IMPLEMENTED
pub fn stub_prodorderingmodedecl() -> bool {
    assert(false, "prod:OrderingModeDecl is not yet implemented");
    false
}

/// Stub for prod:ParenthesizedExpr - NOT YET IMPLEMENTED
pub fn stub_prodparenthesizedexpr() -> bool {
    assert(false, "prod:ParenthesizedExpr is not yet implemented");
    false
}

/// Stub for prod:PathExpr - NOT YET IMPLEMENTED
pub fn stub_prodpathexpr() -> bool {
    assert(false, "prod:PathExpr is not yet implemented");
    false
}

/// Stub for prod:PositionalVar - NOT YET IMPLEMENTED
pub fn stub_prodpositionalvar() -> bool {
    assert(false, "prod:PositionalVar is not yet implemented");
    false
}

/// Stub for prod:Predicate - NOT YET IMPLEMENTED
pub fn stub_prodpredicate() -> bool {
    assert(false, "prod:Predicate is not yet implemented");
    false
}

/// Stub for prod:QuantifiedExpr - NOT YET IMPLEMENTED
pub fn stub_prodquantifiedexpr() -> bool {
    assert(false, "prod:QuantifiedExpr is not yet implemented");
    false
}

/// Stub for prod:ReturnClause - NOT YET IMPLEMENTED
pub fn stub_prodreturnclause() -> bool {
    assert(false, "prod:ReturnClause is not yet implemented");
    false
}

/// Stub for prod:SchemaImport - NOT YET IMPLEMENTED
pub fn stub_prodschemaimport() -> bool {
    assert(false, "prod:SchemaImport is not yet implemented");
    false
}

/// Stub for prod:SequenceType - NOT YET IMPLEMENTED
pub fn stub_prodsequencetype() -> bool {
    assert(false, "prod:SequenceType is not yet implemented");
    false
}

/// Stub for prod:StepExpr - NOT YET IMPLEMENTED
pub fn stub_prodstepexpr() -> bool {
    assert(false, "prod:StepExpr is not yet implemented");
    false
}

/// Stub for prod:StringConstructor - NOT YET IMPLEMENTED
pub fn stub_prodstringconstructor() -> bool {
    assert(false, "prod:StringConstructor is not yet implemented");
    false
}

/// Stub for prod:SwitchExpr - NOT YET IMPLEMENTED
pub fn stub_prodswitchexpr() -> bool {
    assert(false, "prod:SwitchExpr is not yet implemented");
    false
}

/// Stub for prod:TreatExpr - NOT YET IMPLEMENTED
pub fn stub_prodtreatexpr() -> bool {
    assert(false, "prod:TreatExpr is not yet implemented");
    false
}

/// Stub for prod:TryCatchExpr - NOT YET IMPLEMENTED
pub fn stub_prodtrycatchexpr() -> bool {
    assert(false, "prod:TryCatchExpr is not yet implemented");
    false
}

/// Stub for prod:TypeswitchExpr - NOT YET IMPLEMENTED
pub fn stub_prodtypeswitchexpr() -> bool {
    assert(false, "prod:TypeswitchExpr is not yet implemented");
    false
}

/// Stub for prod:UnaryLookup - NOT YET IMPLEMENTED
pub fn stub_produnarylookup() -> bool {
    assert(false, "prod:UnaryLookup is not yet implemented");
    false
}

/// Stub for prod:UnorderedExpr - NOT YET IMPLEMENTED
pub fn stub_produnorderedexpr() -> bool {
    assert(false, "prod:UnorderedExpr is not yet implemented");
    false
}

/// Stub for prod:ValidateExpr - NOT YET IMPLEMENTED
pub fn stub_prodvalidateexpr() -> bool {
    assert(false, "prod:ValidateExpr is not yet implemented");
    false
}

/// Stub for prod:ValueComp - NOT YET IMPLEMENTED
pub fn stub_prodvaluecomp() -> bool {
    assert(false, "prod:ValueComp is not yet implemented");
    false
}

/// Stub for prod:VarDecl - NOT YET IMPLEMENTED
pub fn stub_prodvardecl() -> bool {
    assert(false, "prod:VarDecl is not yet implemented");
    false
}

/// Stub for prod:VarDecl.external - NOT YET IMPLEMENTED
pub fn stub_prodvardecl_external() -> bool {
    assert(false, "prod:VarDecl.external is not yet implemented");
    false
}

/// Stub for prod:VarDefaultValue - NOT YET IMPLEMENTED
pub fn stub_prodvardefaultvalue() -> bool {
    assert(false, "prod:VarDefaultValue is not yet implemented");
    false
}

/// Stub for prod:VersionDecl - NOT YET IMPLEMENTED
pub fn stub_prodversiondecl() -> bool {
    assert(false, "prod:VersionDecl is not yet implemented");
    false
}

/// Stub for prod:WhereClause - NOT YET IMPLEMENTED
pub fn stub_prodwhereclause() -> bool {
    assert(false, "prod:WhereClause is not yet implemented");
    false
}

/// Stub for prod:WindowClause - NOT YET IMPLEMENTED
pub fn stub_prodwindowclause() -> bool {
    assert(false, "prod:WindowClause is not yet implemented");
    false
}
