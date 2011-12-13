# Generated by GOLD Parser Builder using MyBuild program template.

# Rule productions for 'MyFile' grammar.

#
# As for symbols each rule can have a constructor that is used to produce an
# application-specific representation of the rule data.
# Production functions are named '$(gold_grammar)_produce-<ID>' and have the
# following signature:
#
# Params:
#   1..N: Each argument contains a value of the corresponding symbol in the RHS
#         of the rule production.
#
# Return:
#   Converted value that is passed to a symbol handler corresponding to
#   the rule's LHS (if any has been defined).
#
# If production function is not defined then the rule is produced by
# concatenating the RHS through spaces. To reuse this default value one can
# call 'gold_default_produce' function.
#

include mk/mybuild/model.mk

# Rule: <Model> ::= <Package> <Imports> <Entities>
# Args:
#   1. Qualified name of package (if any).
#   2. Import scope object.
#   3. Entities: '<type>/object'
define $(gold_grammar)_produce-Model
	$(foreach m,$(new model,$1),$m
		$(invoke m->set_imports,$2)

		$(silent-foreach entity_type,
				modules \
#				interfaces
				,
			$(invoke m->set_$(entity_type),
					$(filter-patsubst $(entity_type)/%,%,$3))
		)
	)
endef

# Rule: <Package> ::= package <QualifiedName>
$(gold_grammar)_produce-Package_package  = $2

# Rule: <Package> ::=
# Args: 1..0 - Symbols in the RHS.
define $(gold_grammar)_produce-Package
	$(call gold_report_warning,
			Using default package)
endef

## Rule: <Imports> ::= <Import> <Imports>
## Args:
##   1. Imported entity or feature: '<type> FQN[.*]'.
##   2. Import scope.
#define $(gold_grammar)_produce-Imports
#	$(invoke 2->add_imported_$(firstword $1),$(secondword $1))
#endef
#
## Rule: <Imports> ::=
#define $(gold_grammar)_produce-Imports2
#	$(new import_scope)
#endef

# Rule: <Import> ::= import <ImportFeature> <QualifiedNameWithWildcard>
$(gold_grammar)_produce-Import_import    = $2/$3

# Rule: <ImportFeature> ::= feature
$(gold_grammar)_produce-ImportFeature_feature     := feature
# Rule: <ImportFeature> ::=
$(gold_grammar)_produce-ImportFeature             := entity

# Rule: <Entity> ::= <Module>
$(gold_grammar)_produce-Entity           = modules/$1
# Rule: <Entity> ::= <Interface>
$(gold_grammar)_produce-Entity2          = interfaces/$1

# Rule: <Interface> ::= interface Identifier <SuperInterfaces> '{' <InterfaceAttributes> '}'
# Args: 1..6 - Symbols in the RHS.
define $(gold_grammar)_produce-Interface_interface_Identifier_LBrace_RBrace
	$(gold_default_produce)# TODO Auto-generated stub!
endef

# Rule: <SuperInterfaces> ::= extends <InterfaceRefList>
# Args: 1..2 - Symbols in the RHS.
define $(gold_grammar)_produce-SuperInterfaces_extends
	$2
endef

# Rule: <Feature> ::= feature Identifier <SuperFeatures>
# Args: 1..3 - Symbols in the RHS.
define $(gold_grammar)_produce-Feature_feature_Identifier
	$(gold_default_produce)# TODO Auto-generated stub!
endef

# Rule: <SuperFeatures> ::= extends <FeatureRefList>
$(gold_grammar)_produce-SuperFeatures_extends = $2

# <Module> ::= <ModuleModifiers> module Identifier <SuperModule>
#                  '{' <ModuleAttributes> '}'
# Args:
#   1. Modifiers.
#   3. Module name.
#   4. Reference to a super type (if any).
#   6. Attributes.
define $(gold_grammar)_produce-Module_module_Identifier_LBrace_RBrace
	$(foreach m,$(new module,$3),$m

		$(set m->modifiers,$1)
		$(set m->super_module_ref,$4)

		$(silent-foreach attr,
				depends_ref \
				requires_ref \
				provides_ref \
				source \
				object,
			$(set m->$(attr)s,
					$(filter-patsubst $(attr)/%,%,$6))
		)
	)
endef

# Rule: <ModuleModifiers> ::= <ModuleModifier> <ModuleModifiers>
# Args: 1..2 - Symbols in the RHS.
define $(gold_grammar)_produce-ModuleModifiers
	$(if $(filter $1,$2),
		$(call gold_report_error,
				Duplicate module modifier '$1'),
		$1 \
	)
	$2
endef

# Rule: <SuperModule> ::= extends <ModuleRef>
$(gold_grammar)_produce-SuperModule_extends = $2

# Rule: <Depends> ::= depends <ModuleRefList>
$(gold_grammar)_produce-Depends_depends       = $(2:%=$1_ref/%)

# Rule: <FeatureAttribute> ::=  <FeatureRefList>
# <FeatureAttributeNature> ($1) is either 'requires' or 'provides'.
$(gold_grammar)_produce-FeatureAttribute      = $(2:%=$1_ref/%)

# Rule: <FilenameAttribute> ::= <FilenameAttributeNature> <FilenameList>
# <FilenameAttributeNature> ($1) is either 'source' or 'object'.
$(gold_grammar)_produce-FilenameAttribute     = $(2:%=$1/%)

# Rule: <Option> ::= option Identifier ':' <OptionTypeWithAssignment>
# Args: 1..4 - Symbols in the RHS.
define $(gold_grammar)_produce-Option_option_Identifier_Colon
	$(gold_default_produce)# TODO Auto-generated stub!
endef

# Rule: <OptionTypeWithAssignment> ::= string <StringOptionAssignment>
# Args: 1..2 - Symbols in the RHS.
define $(gold_grammar)_produce-OptionTypeWithAssignment_string
	$(gold_default_produce)# TODO Auto-generated stub!
endef

# Rule: <OptionTypeWithAssignment> ::= number <NumberOptionAssignment>
# Args: 1..2 - Symbols in the RHS.
define $(gold_grammar)_produce-OptionTypeWithAssignment_number
	$(gold_default_produce)# TODO Auto-generated stub!
endef

# Rule: <OptionTypeWithAssignment> ::= boolean <BooleanOptionAssignment>
# Args: 1..2 - Symbols in the RHS.
define $(gold_grammar)_produce-OptionTypeWithAssignment_boolean
	$(gold_default_produce)# TODO Auto-generated stub!
endef

# Rule: <StringOptionAssignment> ::= '=' StringLiteral
# Args: 1..2 - Symbols in the RHS.
define $(gold_grammar)_produce-StringOptionAssignment_Eq_StringLiteral
	$(gold_default_produce)# TODO Auto-generated stub!
endef

# Rule: <StringOptionAssignment> ::=
# Args: 1..0 - Symbols in the RHS.
define $(gold_grammar)_produce-StringOptionAssignment
	$(gold_default_produce)# TODO Auto-generated stub!
endef

# Rule: <NumberOptionAssignment> ::= '=' NumberLiteral
# Args: 1..2 - Symbols in the RHS.
define $(gold_grammar)_produce-NumberOptionAssignment_Eq_NumberLiteral
	$(gold_default_produce)# TODO Auto-generated stub!
endef

# Rule: <NumberOptionAssignment> ::=
# Args: 1..0 - Symbols in the RHS.
define $(gold_grammar)_produce-NumberOptionAssignment
	$(gold_default_produce)# TODO Auto-generated stub!
endef

# Rule: <BooleanOptionAssignment> ::= '=' BooleanLiteral
# Args: 1..2 - Symbols in the RHS.
define $(gold_grammar)_produce-BooleanOptionAssignment_Eq_BooleanLiteral
	$(gold_default_produce)# TODO Auto-generated stub!
endef

# Rule: <BooleanOptionAssignment> ::=
# Args: 1..0 - Symbols in the RHS.
define $(gold_grammar)_produce-BooleanOptionAssignment
	$(gold_default_produce)# TODO Auto-generated stub!
endef

# Rule: <MakeAttribute> ::= make <Make>
# Args: 1..2 - Symbols in the RHS.
define $(gold_grammar)_produce-MakeAttribute_make
	$(gold_default_produce)# TODO Auto-generated stub!
endef

# Rule: <Make> ::= <MakeFlags>
# Args: 1..1 - Symbols in the RHS.
define $(gold_grammar)_produce-Make
	$(gold_default_produce)# TODO Auto-generated stub!
endef

# Rule: <Make> ::= <MakeRule>
# Args: 1..1 - Symbols in the RHS.
define $(gold_grammar)_produce-Make2
	$(gold_default_produce)# TODO Auto-generated stub!
endef

# Rule: <MakeFlags> ::= flags <StringList>
# Args: 1..2 - Symbols in the RHS.
define $(gold_grammar)_produce-MakeFlags_flags
	$(gold_default_produce)# TODO Auto-generated stub!
endef

# Rule: <MakeRule> ::= <Filename> <Prerequisites> <Recipes>
# Args: 1..3 - Symbols in the RHS.
define $(gold_grammar)_produce-MakeRule
	$(gold_default_produce)# TODO Auto-generated stub!
endef

# Rule: <Prerequisites> ::= ':' <FilenameList>
# Args: 1..2 - Symbols in the RHS.
define $(gold_grammar)_produce-Prerequisites_Colon
	$(gold_default_produce)# TODO Auto-generated stub!
endef

# Rule: <Prerequisites> ::=
# Args: 1..0 - Symbols in the RHS.
define $(gold_grammar)_produce-Prerequisites
	$(gold_default_produce)# TODO Auto-generated stub!
endef

# Rule: <Recipes> ::= '{' <StringList> '}'
# Args: 1..3 - Symbols in the RHS.
define $(gold_grammar)_produce-Recipes_LBrace_RBrace
	$(gold_default_produce)# TODO Auto-generated stub!
endef

# Rule: <Recipes> ::=
# Args: 1..0 - Symbols in the RHS.
define $(gold_grammar)_produce-Recipes
	$(gold_default_produce)# TODO Auto-generated stub!
endef

# <InterfaceRef> ::= <QualifiedName>
$(gold_grammar)_produce-InterfaceRef =             = $(call gold_report_error,NIY)
# <FeatureRef> ::= <QualifiedNameWithWildcard>
$(gold_grammar)_produce-FeatureRef                 = $(call gold_report_error,NIY)
# <ModuleRef> ::= <QualifiedName>
$(gold_grammar)_produce-ModuleRef                  = $(new module_ref,$1)
# <Filename> ::= StringLiteral
$(gold_grammar)_produce-Filename_StringLiteral     = $(new filename,$1)
# <String> ::= StringLiteral
$(gold_grammar)_produce-String_StringLiteral       = $(new string,$1)

# <InterfaceRefList> ::= <InterfaceRef> ',' <InterfaceRefList>
$(gold_grammar)_produce-InterfaceRefList_Comma     = $1 $3
# <FeatureRefList> ::= <FeatureRef> ',' <FeatureRefList>
$(gold_grammar)_produce-FeatureRefList_Comma       = $1 $3
# <ModuleRefList> ::= <ModuleRef> ',' <ModuleRefList>
$(gold_grammar)_produce-ModuleRefList_Comma        = $1 $3
# <FilenameList> ::= <Filename> ',' <FilenameList>
$(gold_grammar)_produce-FilenameList_Comma         = $1 $3
# <StringList> ::= <String> ',' <StringList>
$(gold_grammar)_produce-StringList_Comma           = $1 $3

# <QualifiedName> ::= Identifier '.' <QualifiedName>
$(gold_grammar)_produce-QualifiedName_Identifier_Dot         = $1.$3
# <QualifiedNameWithWildcard> ::= <QualifiedName> '.*'
$(gold_grammar)_produce-QualifiedNameWithWildcard_DotTimes   = $1.%


$(def_all)

