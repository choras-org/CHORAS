---
title: 'CHORAS: the Community Hub for Open-source Room Acoustics Software'
tags:
  - Python
  - room acoustics
  - simulation
  - web interface
  - React
authors:
  - name: Silvin Willemsen
    orcid: 0000-0002-4062-5473
    corresponding: true # (This is how to denote the corresponding author)
    equal-contrib: true
    affiliation: 1 # (Multiple affiliations must be quoted)
  - name: Marco Berzborn
    orcid: 0000-0002-4421-1702
    corresponding: true # (This is how to denote the corresponding author)
    equal-contrib: true # (This is how you can denote equal contributions between multiple authors)
    affiliation: 1
  - name: Alexander Nolte
    orcid: 0000-0003-1255-824X
    affiliation: 2
  - name: Alexander Serebrenik
    orcid: 0000-0002-1418-0095
    affiliation: 2
  - name: Ilaria Fichera
    orcid: 0000-0002-0097-1486
    affiliation: 1
  - name: Huiqing Wang
    orcid: 0000-0003-3465-3555
    affiliation: 1
  - name: Lavínia Paganini
    orcid: 0000-0002-2729-0314
    affiliation: 2
  - name: Zeyu Xu
    orcid: 0000-0002-4158-6218
    affiliation: 3
  - name: Anjana Rajasekhar
    affiliation: 3
  - name: Albert Prinn
    orcid: 0000-0003-3491-3644
    affiliation: 4
  - name: Nicolas Fortin
    affiliation: 5  
  - name: Judicaël Picaut
    affiliation: 5
  - name: Nikolas Borrel-Jensen
    affiliation: 6
  - name: Hossein Firooz
    affiliation: 7
  - name: Lauri Savioja
    affiliation: 7
  - name: Ajat Dajorat
    affiliation: 8
  - name: Radhea Amardika
    affiliation: 8
  - name: Fachri Hawari
    affiliation: 8
  - name: Maarten Hornikx
    corresponding: true # (This is how to denote the corresponding author)
    equal-contrib: true
    affiliation: 1
affiliations:
 - name: Department of the Built Environment, Eindhoven University of Technology, The Netherlands
   ror: https://ror.org/02c2kyt77
   index: 1
 - name: Department of Mathematics and Computer Science, Eindhoven University of Technology, The Netherlands
   index: 2
 - name: International Audio Laboratories Erlangen, Germany.
   index: 3
 - name: Fraunhofer Institute for Integrated Circuits IIS, Erlangen, Germany.
   index: 4
 - name: Université Gustave Eiffel, CEREMA, UMRAE, France.
   index: 5
 - name: Pasteur Labs, USA.
   index: 6
 - name: Department of Computer Science, Aalto, Finland.
   index: 7
 - name: Hacktiv8, Indonesia.
   index: 8

date: 15 December 2026
bibliography: paper.bib

---

# Summary

# Statement of need

The field of simulating room acoustics 

Although in recent years, an increasing amount of effort has been put in making these software open source, many live on their own repository and require technical know-how to be used [@Hornikx:2024].

The Community Hub for Open-source Room Acoustics Software (CHORAS) aims [@Willemsen:2025]

[@CHORAS]

The goal of CHORAS is threefold:

1. to provide a platform for researchers to bring their software closer to end users.
2. to allow (non-technical) end-users an easy way to use existing simulation methods
3. to create an easy way for various room acoustics simulation methods to be compared.

Altogether, CHORAS intends to increase the impact of the collecive work if the room acoustics simulation community

CHORAS is a collaboration between various universities and institutes working on room acoustics simulation software, front-end developers, acoustic consultants (i.e., the end user).

Room acoustics simuation methods which are already coupled:

| Name | Paper(s)         | Repository |
|----------|:---------------:|:-----------------:|
| The acoustic diffusion equation (DE)  | [@Fichera:2025; @Fichera:2024] | [[@Fichera_acousticDE_2025]](https://github.com/Building-acoustics-TU-Eindhoven/acousticDE/) |
| Discontinuous Galerkin (DG) method    | [@Wang_DG_RoomAcoustics_2024]  | [@wang2024open]            |
| Pyroomacoustics                       | [@Scheibler:2018]              | [@pyroomacoustics]         |
| DEISM                                 | [@Xu:2024]                     | [@DEISM]                   |
| SPPS                                  | [@Picaut:2012]                 | [@iSimpa]                  |
| DeepONet                              | [@borrel-jensen2023sound]      | [@deeponet:2025]           |
| ParallelFDTD                          | [@Saarelma:2014]               | [@parallelFDTD]            |

Room acoustics simuation methods already coupled:
- The acoustic diffusion equation (DE) (software: [@Fichera_acousticDE_2025])
- Discontinuous Galerkin (DG) method (paper: [@Wang_DG_RoomAcoustics_2024], repository: [@wang2024open])
- Pyroomacoustics (paper: [@Scheibler:2018], software: [@pyroomacoustics])
- DEISM (paper: [@Xu:2024], software: [@DEISM])
- SPPS (paper: software: [@iSimpa])
- DeepONet (paper: [@borrel-jensen2023sound], software: [@deeponet:2025])


# Citations

Citations to entries in paper.bib should be in
[rMarkdown](http://rmarkdown.rstudio.com/authoring_bibliographies_and_citations.html)
format.

If you want to cite a software repository URL (e.g. something on GitHub without a preferred
citation) then you can do it with the example BibTeX entry below for @fidgit.

For a quick reference, the following citation commands can be used:
- `@author:2001`  ->  "Author et al. (2001)"
- `[@author:2001]` -> "(Author et al., 2001)"
- `[@author1:2001; @author2:2001]` -> "(Author1 et al., 2001; Author2 et al., 2002)"

# Figures

Figures can be included like this:
![Caption for example figure.\label{fig:example}](figure.png)
and referenced from text using \autoref{fig:example}.

Figure sizes can be customized by adding an optional second parameter:
![Caption for example figure.](figure.png){ width=20% }

# Acknowledgements

Ajat Dajorat, Radhea Amardika, Fachri Hawari

# References