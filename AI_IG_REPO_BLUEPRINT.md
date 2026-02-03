# IG Repository Blueprint for AI Agent

Purpose: This document instructs an AI agent to create a repository that mirrors the structure, navigation, and “look & feel” of this IG, using a PDF specification as the source of truth.

## 1) Inputs

You will be given:
- A PDF specification file (primary content source).
- This blueprint file.

Goal:
- Build a repo that matches the structure, menu, and content organization used here.
- Produce an IG that visually and structurally aligns with this repo when rendered.

## 2) Reference Structure (Must Mirror)

Create the following top-level structure:
- ig.ini
- sushi-config.yaml
- input/
  - content/
  - data/
  - externalDependencies/
  - fsh/
  - fsh-generated/
  - images/
  - images-source/
  - includes/
  - pagecontent/
  - resources/
- fsh-generated/ (SUSHI output)
- output/ (IG Publisher output)
- package.json (SUSHI install convenience, if needed)
- README.md (build instructions)

## 3) Configuration Files (Copy Pattern)

### 3.1 ig.ini
Create ig.ini with this pattern (adjust IG JSON name if necessary):

[IG]
ig = fsh-generated/resources/ImplementationGuide-<id>.json
template = https://github.com/gematik/fhir-ig-template
auto-load = true

### 3.2 sushi-config.yaml
Create sushi-config.yaml with the same shape as below. Fill in metadata (canonical, id, name, title, version, jurisdiction, publisher) based on the PDF specification.

Required keys and structure:
- canonical
- fhirVersion: 4.0.1
- id
- name
- title
- status
- version
- copyrightYear
- releaseLabel
- jurisdiction
- publisher:
  - name
  - url
  - email
- dependencies: (only include those referenced in PDF)
- applyExtensionMetadataToRoot: false
- menu: (see section 4)
- pages: (see section 5)
- parameters:
  - path-resource: [input/resources/structuremaps, input/resources/kbv-bundles, input/resources/transformed-kbv-bundles] (create only those used)
  - path-pages: [input/content]
  - no-narrative: (list resource types as in this repo)

## 4) Menu Construction (Must Match This IG Layout)

Recreate the same menu structure and naming (German labels), unless the PDF explicitly dictates different labels. The menu must map to markdown pages in input/content and produce the same navigation tree.

Menu template:
- Start → index.html
- Fachlichkeit → menu-fachlichkeit-ueberblick.html, menu-fachlichkeit-szenarien.html, menu-fachlichkeit-anwendungsfaelle.html
- Technische Umsetzung → menu-technische-umsetzung-systemueberblick.html, menu-technische-umsetzung-anwendungsfaelle.html, menu-technische-umsetzung-verarbeitungsregeln.html, menu-technische-umsetzung-dosierung.html, mapping.html
- Schnittstellen → menu-schnittstellen-generelle-prinzipien.html, menu-schnittstellen-datenschutz-und-sicherheit.html, menu-schnittstellen-query-api.html, menu-schnittstellen-operation-api.html, menu-schnittstellen-additional-api.html
- FHIR-Artefakte → artifacts.html
- Anhänge → referenced.html, downloads.html, erp-openapi.html, release-notes.html, spec-sheet.html, comparisons.html, license.html

If the PDF contains additional sections, add them as subpages under the closest parent, and add to both menu and pages.

## 5) Page Tree and Titles

Create markdown files in input/content that match the menu/page structure and titles. Use the following page map as a base and then populate with content extracted from the PDF:

- index.md: title "Implementation Guide …" (PDF-defined)
- menu-fachlichkeit-ueberblick.md
  - menu-fachlichkeit-szenarien.md
    - menu-fachlichkeit-szenarien-diga.md
    - menu-fachlichkeit-szenarien-t-rezept.md
  - menu-fachlichkeit-anwendungsfaelle.md
- menu-technische-umsetzung-systemueberblick.md
  - menu-technische-umsetzung-anwendungsfaelle.md
  - menu-technische-umsetzung-verarbeitungsregeln.md
  - menu-technische-umsetzung-dosierung.md
  - menu-technische-umsetzung-anbindung-epa-ms.md
  - menu-technische-umsetzung-anbindung-fvzd.md
  - menu-technische-umsetzung-anbindung-bfarm.md
- menu-schnittstellen-generelle-prinzipien.md
- menu-schnittstellen-datenschutz-und-sicherheit.md
- menu-schnittstellen-query-api.md
- menu-schnittstellen-operation-api.md
  - op-create.md
  - op-activate.md
  - op-abort.md
- menu-schnittstellen-additional-api.md
- artifacts.md
- referenced.md
- downloads.md
- erp-openapi.md
- release-notes.md
- spec-sheet.md
- comparisons.md
- license.md

Use the titles from the PDF specification to populate the `pages` section in sushi-config.yaml and the H1 headers inside each markdown file.

## 6) Content Extraction from PDF

Perform a structured extraction from the PDF:
1) Build a section outline by reading headings and subheadings.
2) Map each section to the nearest page in the tree above.
3) For each page:
   - Write a concise introduction (1–2 paragraphs).
   - Add subsections and bullet lists matching the PDF.
   - Add tables (as Markdown) for requirements, rules, or mappings.
   - Add diagrams as images: place files in input/images and reference them.
4) Keep consistent terminology and naming as in the PDF.

If the PDF uses German labels, keep German headings and titles.

## 7) Additional Input Folders

Populate these if the PDF includes related artifacts:
- input/resources/: FHIR resources (StructureDefinitions, ValueSets, etc.)
- input/includes/: reusable narrative fragments
- input/pagecontent/: custom HTML snippets if needed
- input/images/ and input/images-source/: diagrams and sources
- input/data/: CSV/JSON data assets
- input/externalDependencies/: external packages used in IG
- input/fsh/: FSH definitions (profiles, extensions, instances)

## 8) Build Guidance (Add to README.md)

Provide a brief README with:
- Install SUSHI: npm i -g fsh-sushi
- Build SUSHI: sushi .
- Run IG Publisher (if scripts are included): _build.sh or _genonce.sh

## 9) Validation Checklist

Before completion, ensure:
- All menu items point to existing pages.
- All pages listed in sushi-config.yaml exist in input/content.
- Images referenced are present in input/images.
- ig.ini points to the generated ImplementationGuide JSON.
- The repository structure matches section 2 exactly.

## 10) Output Expectations

Deliver:
- Fully populated input/content from the PDF.
- Correct sushi-config.yaml with menu and pages.
- ig.ini pointing to the correct IG JSON.
- Optional FSH artifacts if the PDF defines profiles or extensions.

End of instructions.
