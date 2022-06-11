---
title: "Metaverse Backpack"
---

## Introduction Change

### Overview

Metaverse backpack enables interoperability between _Providers_ and _Consumers_ across _Types_.

### Terminology

When capitalized, the words ‘MUST’, ‘MUST NOT’, ‘SHOULD’, ‘SHOULD NOT’, and ‘MAY’ in this document are to be interpreted as described in IETF [RFC 2119](https://www.ietf.org/rfc/rfc2119.txt).

## Design goals

The overarching goal of the _Backpack_ is interoperability. However, interoperability must not be achieved
by circumventing critical aspects. These aspects get protected by the design goals.

From user perspective:

- User-centricity: a user owns and controls all _Backpack Items_
- Private: only involved parties know that an interaction happened and exchanged data is private between these parties
- Freedom: involved parties dictate and agree upon all terms

From developer perspective:

- Maintainability: Backpack and it's _modules_ are core infrastructure components. Thus, software maintainability is critical
- Composability: _modules_ and adjacent technologies need to be composable to enable a broad set of use cases

## Backpack Container

### Overview

### Examples

Selection of two avatars.

```js
tbd.
```

## Backpack Item

### Overview

_Backpack Items_ describe a concrete Entity that is stored and managed in the _Backpack_. It is also used when
_Consumers_ load and _Backpack Item_.

Attributes describe each _Backpack Item_ and how it can be used. The set of Attributes can be found in the Table below.

| Attribute | Description                                                 | Mandatory | Example                 |
| --------- | ----------------------------------------------------------- | --------- | ----------------------- |
| type      | Indicator for the type of Item from a well-known list       | Yes       | `avatar`                |
| data      | Data payload of the Item                                    | Yes       | `ipfs://XYZ`, `0x00...` |
| metadata  | Metadata for the item, syntax defined by Item type          | No        | `{}`                    |
| format    | Indicator for the format of the data provided in data field | No        | `URL`, `base64`         |
| version   | Provider Item version indicator                             | No        | `1.0.1`                 |
:Backpack Item attributes

All attributes are strings. Dependent on the type, further definitions apply as outlined in section Type-based definitions.

### Examples

## Encoding

_Backpack Containers_ and _Backpack Items_ use JSON as encoding. The JSON format has a number of benefits:

- Better syntax to data ratio than SGML based markup
- Dynamic field sizes
- Easy to interpret and to edit by developers compared to binary formats

and a number of drawbacks:

- Slow parsing performance

Additional encodings can be added in the future. To preserve interoperability, implementations need to support all mandatory encodings. However, the goal
should be to achieve more suitable characteristics (benefits and drawbacks) for additional use cases via introducing the new encodings.
Adding encodings increases complexity, dependencies and reduces overall maintainability and therefore must be carefully decided.

## Types

### Defined types

The first module enables in _Backpack_ is _Avatar_.

### Type-based definitions

#### Avatar

##### Overview

##### Metadata

| Attribute  | Description                                                        | Mandatory | Example    |
| ---------- | ------------------------------------------------------------------ | --------- | ---------- |
| source     | Provider of the given avatar                                       | N         | `rpm`      |
| reference  | Reference to a proof or origin e.g. a smart contract address       | N         | `0x00`     |
| fileformat | File format indicator especially useful if not using glTF standard | N         | `VRM`      |
| gender     | Gender indicator for the given avatar                              | N         | `female`   |
| type       | Type indicator for the given avatar                                | N         | `humanoid` |
| head       | Node identifier for head used for camera placement                 | N         | `head`     |
:Avatar specific metadata

The well-known sources (avatar providers) are listed in the table below. Backpack SHOULD output valid and standardized (in terms of node names, bone structure) glTF for all avatar sources. Backpack and client libraries SHOULD make an effort to test against all well-known avatar providers.

| Name            | Full Name       | References |
| --------------- | --------------- | ---------- |
| `rpm`           | Ready Player Me | website    |
| `cryptoavatars` | Crypto Avatars  | website    |
: Well-known sources (avatar providers)

##### Data

Backpack SHOULD always provide glTF encoded data.

Valid input formats to the Backpack MUST include glTF.

The Backpack CAN support additional formats for input and output, including, but not limited to:

- VRM

This list of formats is defined on a best-effort basis and based in industry and market observations.

##### Format

### Custom types

Custom types can be introduced for use cases where global interoperability is not a design goal. Instead, use of custom types enables specific use cases involving a set of known participants.