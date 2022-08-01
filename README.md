# dita-example-schema-bundle

> This is an example schema bundle for DITA 1.3 element support in FontoXML. The code in this repository is for educational purposes. FontoXML does not provide any warranty with regards to feature-completeness or stability of this package. Please see the license file for more information.

This software contains the DITA 1.3 + MathML 3 XSD schema files with the following changes:

- Disallow text and inline elements in places where block-level elements are allowed.
- Does not contain SVG 1.1

Additionally, this bundle contains XSLTs to convert regular DITA 1.3 XML instances so that it validates with this
slightly stricter schema version.

Please review [fonto.json](./fonto.json) for the schema locations correlating with each shell.

## Fonto Editor schema compilation

This repository can be used to create schema packages required for the Fonto Editor to function.

Follow the instructions on [How to compile an updated schema into an existing editor](https://documentation.fontoxml.com/latest/re-compile-the-schema-1fe416604f65).

## DITA Open Toolkit plugin

This repository doubles as a [DITA Open Toolkit](https://www.dita-ot.org/download) plugin.

1. Install the plugin using `dita install` ([documentation](https://www.dita-ot.org/dev/topics/plugins-installing.html)).

1. Validate that the plugin was installed succesfully using `dita plugins` ([documentation](https://www.dita-ot.org/dev/parameters/dita-command-arguments.html#plugins)).

## License

This project is licensed under [MIT](http://www.opensource.org/licenses/mit-license.php "Read more about the MIT license form"). Refer to [LICENCE.md](./LICENSE.md) for more information.
