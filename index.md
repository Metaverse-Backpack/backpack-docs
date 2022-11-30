---
title: "Hammerspace"
version: "0.0.1"
---

## Abstract

## Status of this document

This section describes the status of this document at the time of its publication. The latest publicly available revision can be found at [https://docs.hammerspace.me](https://docs.hammerspace.me). The current working document can be found on [GitHub](https://www.github.com/hammerspace-me/docs).

Comments regarding this specification are welcome at any time. Please [file issues](https://github.com/hammerspace-me/docs/issues) on GitHub, or contact us directly via [email](mailto:benedikt.woelk@protocol.ai).

This specification is written and published by the [Protocol Labs Metaverse team](https://metaverse.filecoin.io).

## Introduction

### Overview

Today, user's can create or buy various digital assets on different platforms (e.g., a 3D avatar on Ready Player Me, an NFT from Open Sea), but utility is limited to the integrations that the platforms provide. Platforms are not globally interoperable due to missing governance bodies that drive standards and their adoption.

This specification is the result of solving the gap of a missing governance body and standards by introducing the concept of a Hammerspace. The Hammerspace is an open standard to describe a user-centric storage component for digital assets belonging to an individual. This specification describes a basic Hammerspace by introducing Spaces and Items. Additionally Types are defined for a more opinionated version of the Hammerspace with specific type definitions for Items. As a result, Hammerspace enables global interoperability between _Technology Providers_ and _Consumers_ across _Types_ owned by an _Owner_.

### Ecosystem Overview

This section describes the roles of the core actors and the relationships between them in an ecosystem where a Hammerspace is expected to gain value. A role is an abstraction that might be implemented in many different ways. The following roles are introduced in this specification:

#### Technology Provider

A _Technology Provider_ is an entity or system which provides a technology to create new assets on behalf of the owner (e.g., an avatar provider who provides a graphical user interface to create 3D avatars). Technology Providers MAY also be issuers of credentials.

#### Consumer

A _Consumer_ is a Metaverse or Game that wants to gain access to the assets created by the Technology Provider and owned by the Owner. Consumer MAY also be verifier of credentials.

#### Owner

An _Owner_ is an entity which holds the proof of ownership for the assets created by the Technology Providers.

There _MAY_ be entities which take the role of a Technology Provider and Consumer at the same time (e.g., a game which creates NFTs and stores them in Hammerspace as well as reading them).

### Terminology

When capitalized, the words ‘MUST’, ‘MUST NOT’, ‘SHOULD’, ‘SHOULD NOT’, and ‘MAY’ in this document are to be interpreted as described in IETF [RFC 2119](https://www.ietf.org/rfc/rfc2119.txt).

## Design goals

The overarching goal of the _Hammerspace_ is interoperability. However, interoperability must not be achieved
by circumventing critical aspects. These aspects get protected by the design goals.

From user perspective:

- User-centricity: a user owns and controls all _Items_
- Privacy: only involved parties know that an interaction happened and exchanged data is private between these parties
- Freedom: involved parties dictate and agree upon all terms

From developer perspective:

- Maintainability: Hammerspace and it's _modules_ are core infrastructure components. Thus, software maintainability is critical
- Composability: _Modules_ and adjacent technologies need to be composable to enable a broad set of use cases

## Space

### Overview

_Spaces_ describe a collection of _Items_ owned by a single _Owner_. It is fully controlled and managed by the _Owner_. An _Owner_ MAY have multiple _Spaces_.

Properties describe each _Space_. The set of properties can be found in the Table below.

| Properties | Type           | Description                                                   | Mandatory | Example values |
| ---------- | -------------- | ------------------------------------------------------------- | --------- | -------------- |
| owner      | string         | Public key identifier of the owner (e.g., owner's eth adress) | Yes       | `0x00...`      |
| items      | array of Items | Collection of Items                                           | Yes       | `[]`           |

:Space properties

### Examples

Selection of two avatars.

```js

```

## Item

### Overview

_Items_ describe a concrete digital asset that is stored and managed in _Hammerspace_. It is also used when
_Consumers_ retrieve an _Item_.

Properties describe each _Item_ and how it can be used. The set of Attributes can be found in the Table below.

| Property      | Type   | Description                                                  | Mandatory | Example values                         |
| ------------- | ------ | ------------------------------------------------------------ | --------- | -------------------------------------- |
| type          | string | Indicator for the type of Item from a well-known list        | Yes       | `avatar`, `nft`, `custom`              |
| data          | string | Data payload of the Item                                     | Yes       | `ipfs://XYZ`, `0x00...`                |
| format        | string | Indicator for the format of the data provided in data field  | Yes       | `URL`, `base64`                        |
| mimeType      | string | MIME type of data payload                                    | No        | `model/gltf+json`, `model/gltf-binary` |
| origin        | string | Identifier of technology provider                            | No        | `ready-player-me`, `meebits`           |
| reference     | string | Reference to a proof or origin e.g. a smart contract address | No        | `0x00...`, `https://...`               |
| referenceType | string | Type of reference, e.g., (smart) contract, url               | No        | `url`, `contract`                      |
| version       | string | Provider Item version indicator                              | No        | `1.0.1`                                |
| metadata      | object | Metadata for the item, syntax defined by Item type           | No        | `{}`                                   |

:Item properties

### Examples

## Encoding

_Spaces_ and _Items_ use JSON as encoding. The JSON format has a number of benefits:

- Better syntax to data ratio than SGML based markup
- Dynamic field sizes
- Easy to interpret and to edit by developers compared to binary formats

and a number of drawbacks:

- Slow parsing performance

Additional encodings can be added in the future. To preserve interoperability, implementations need to support all mandatory encodings. However, the goal
should be to achieve more suitable characteristics (benefits and drawbacks) for additional use cases via introducing the new encodings.
Adding encodings increases complexity, dependencies and reduces overall maintainability and therefore must be carefully decided.

## Types

_Types_ extend the basic definition of _Hammerspace_ by giving opinionated type definitions for Items. For each Type the following aspects are considered:

- Description
- Metadata structure
- Well-known technology providers list
- Data and format considerations
- Security considerations
- Dependencies
- Limitations
- Examples

### Defined types

An _Item_ SHOULD HAVE have a specific _Type_ or MUST be classified as _Custom_ if none of the well-known types are applicable or global interoparability is not a design goal.

| Type   | Description                                                                          |
| ------ | ------------------------------------------------------------------------------------ |
| Avatar | 3D model (humanoid) representing a particular individual                             |
| NFT    | Unique digital identifier linked to a digital asset that is recorded on a blockchain |
| Custom | Arbitrary digital asset not linked to a specific technology provider                 |

### Custom types

Custom types can be introduced for use cases where global interoperability is not a design goal. Instead, use of custom types enables specific use cases involving a set of known participants.

### Type definitions

#### Avatar

##### Description

An avatar is a 3D model, mostly humanoid, representing a particular individual. Avatars MAY be used as a representation of the Hammerspace _Owner_ in a Metaverse or Game. Avatars MAY be NFTs minted on a blockchain (NOTE: NFT avatars are typed as avatars, but store the contract adress as a reference).

##### Metadata structure

| Property | Description                                                                         | Mandatory | Example                                        |
| -------- | ----------------------------------------------------------------------------------- | --------- | ---------------------------------------------- |
| type     | Type indicator for the given avatar                                                 | N         | `humanoid`, `humanoid-male`, `humanoid-female` |
| bodyType | Body type of the given avatar                                                       | N         | `full-body`, `half-body`                       |
| nodes    | Mapping of bone structure to GLTF nodes (bone structure currently not standardized) | N         | `{ head: "38" }`                               |

:Avatar specific metadata

##### Well-known technology providers list

| Identifier        | Name            | References                          |
| ----------------- | --------------- | ----------------------------------- |
| `ready-player-me` | Ready Player Me | [website](https://readyplayer.me)   |
| `meebits`         | Meebits         | [website](https://meebits.app)      |
| `crypto-avatars`  | Crypto Avatars  | [website](https://cryptoavatars.io) |

: Well-known Technology Providers of avatars

##### Data and format considersations

Hammerspace SHOULD output valid and standardized (in terms of node names, bone structure) glTF for all avatar sources. Technology Providers MAY use VRM as an extension to glTF, but SHOULD use it carefully as standardization is not finalized yet. VRM extends gLTF with a mapping to standardized node names and bone structure. The same result can be achived by using standardized node names and bone structure in gLTF.
Hammerspace and client libraries SHOULD make an effort to test against all well-known avatar providers (see well-known technology providers list). Formats are defined on a best-effort basis and based on industry and market observations.

##### Dependencies

Standardization of node names and bone structures of 3D models have a dependency to the type _Emote_. Emotes consist of sound and animations. Animations are applied to 3D avatars on standard node names and bone structures.

##### Limitations

- Missing definitions for half-body and non-humanoid avatars
- Limited interoperability for animations: Even if standardized node names and bone structures are introduced to 3D models, interoperability for animations can not fully be garantueed. Animations are based on changing absolute position and rotation of bones, which can result in unbalanced animations if the size of certain bones vary between 3D models.

##### Examples

```json
{
  "space": "0x00",
  "data": "bafybeidv6qcn7ph6rnsr2bu7xqycxqrfwke2fyx4yauwi5f7qhiaxnfy2i/6304ca213e172e005443585b.glb",
  "origin": "ready-player-me",
  "reference": "https://readyplayer.me/xx.glb",
  "referenceType": "url",
  "type": "avatar",
  "format": "url",
  "mimeType": "model/gltf-binary",
  "metadata": {
    "type": "humanoid-male",
    "bodyType": "full-body",
    "nodes": null
  },
  "version": "1.0.0"
}
```

## Revision History

This section contains the substantive changes that have been made since the previous version (0.0.1) of this specification.

Changes since version 0.0.1:

- _(10/06/2022, Tobias Petrasch):_ Change definition of Space and Item
- _(10/06/2022, Tobias Petrasch):_ Add ecosystem overview
- _(10/06/2022, Tobias Petrasch):_ Change structure of Types
- _(10/06/2022, Tobias Petrasch):_ Add avatar as a new Type
