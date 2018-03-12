# dita-example-schema-bundle

> This is an example schema bundle for DITA 1.3 element support in FontoXML. The code in this repository is for
  educational purposes. FontoXML does not provide any warranty with regards to feature-completeness or stability of this
  package. Please see the license file for more information.

This software contains the DITA 1.3 + MathML 3 XSD schema files with the following changes:

- Disallow text and inline elements in places where block-level elements are allowed.
- Does not contain SVG 1.1

Additionally, this bundle contains XSLTs to convert regular DITA 1.3 XML instances so that it validates with this
slightly stricter schema version.

Please review [fonto.json](./fonto.json) for the schema locations correlating with each shell.

## To use

- Create a ZIP archive for the contents of this repository.

- Follow the instructions to [integrate a schema](
  http://documentation.fontoxml.com/editor/latest/integrate-a-schema-3099089.html) in your FontoXML editor as per
  normal.
