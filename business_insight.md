# Netflix Analytics Dashboard

## Business Insight Report

### Executive Overview

This analysis examines **8,807 Netflix titles** to understand the
composition, distribution, and characteristics of the content catalog.
The analysis covers content types, production countries, genres, rating
classifications, release years, catalog addition patterns, movie
durations, and TV show season distributions.

Key findings:

- **Movie-dominated catalog:** Movies account for 6,131 titles (69.62%),
  while TV Shows account for 2,676 titles (30.38%).
- **Global content representation:** The catalog contains titles
  associated with 122 countries. The United States has the largest
  country contribution, with 3,690 titles, followed by India with 1,046.
- **Genre concentration:** International Movies (2,752 titles) and
  Dramas (2,427 titles) are the two largest genre categories.
- **Content rating distribution:** Mature is the largest analytical
  rating group, with 4,009 titles (45.52%). This grouping is an
  analytical classification used in this project, not an official
  Netflix category.
- **Catalog addition trends:** 2019 recorded the highest number of
  content additions, with 2,016 titles.
- **Movie duration:** Average movie duration is approximately 99.56
  minutes. The largest duration group is 91–120 minutes, with 2,996
  titles.
- **TV Show seasons:** 1,793 TV Shows (approximately 67%) have one
  season; approximately 75% have no more than two seasons.

The findings describe catalog metadata. They do not directly measure
audience preferences, viewing performance, revenue, subscriber behavior,
production investment, or Netflix’s internal business strategy.

------------------------------------------------------------------------

## 1. Content Portfolio Overview

### Key Metrics

| KPI                     |         Value |
|:------------------------|--------------:|
| Total Titles            |         8,807 |
| Total Movies            |         6,131 |
| Total TV Shows          |         2,676 |
| Total Countries         |           122 |
| Total Genres            |            42 |
| Average Release Year    |          2014 |
| Average Movie Duration  | 99.56 minutes |
| Average TV Show Seasons |  1.76 seasons |

### Business Insight

The Netflix catalog in this dataset contains 8,807 titles associated
with 122 countries and 42 genre categories. The catalog is dominated by
Movies, while TV Shows account for a smaller share.

International Movies and Dramas are the two largest genre categories.
Mature is also the largest group in the project’s analytical rating
classification.

These findings describe the breadth and composition of the available
catalog. They should not be interpreted as evidence of audience demand
or commercial performance.

## 2. Movie vs TV Show Distribution

### Content Distribution

| Content Type |    Titles |       Share |
|:-------------|----------:|------------:|
| Movie        |     6,131 |      69.62% |
| TV Show      |     2,676 |      30.38% |
| **Total**    | **8,807** | **100.00%** |

### Business Insight

Movies represent 69.62% of the catalog, making them the dominant content
format in the dataset. The number of Movie titles is approximately 2.3
times the number of TV Show titles.

This indicates that the available catalog contains substantially more
Movies than TV Shows. The dataset does not provide production costs,
acquisition costs, or investment information, so it cannot establish why
this distribution exists.

## 3. Global Content Distribution

### Top 10 Countries

| Country        | Titles |
|:---------------|-------:|
| United States  |  3,690 |
| India          |  1,046 |
| United Kingdom |    806 |
| Canada         |    445 |
| France         |    393 |
| Japan          |    318 |
| Spain          |    232 |
| South Korea    |    231 |
| Germany        |    226 |
| Mexico         |    169 |

### Business Insight 1: United States Has the Largest Country Contribution

The United States has the largest country contribution, with 3,690
titles. This represents approximately 41.9% of the 8,807-title catalog
when compared with the overall title count.

A title may be associated with more than one production country.
Therefore, country counts are not mutually exclusive and should not be
summed to calculate the number of unique titles.

### Business Insight 2: India Is the Second-Largest Contributor

India ranks second with 1,046 titles. This indicates substantial
representation of India-associated content in the available catalog.

The dataset does not contain country-level subscriber, viewing, or
production-cost information, so it cannot explain the business factors
behind this representation.

### Business Insight 3: The Catalog Has Broad Geographic Representation

The catalog contains titles associated with 122 countries. This
demonstrates broad geographic representation in the metadata, although
the number of titles alone does not measure the performance of content
in each market.

## 4. Genre Distribution Analysis

### Top Genre Categories

| Genre                    | Titles |
|:-------------------------|-------:|
| International Movies     |  2,752 |
| Dramas                   |  2,427 |
| Comedies                 |  1,674 |
| International TV Shows   |  1,351 |
| Documentaries            |    869 |
| Action & Adventure       |    859 |
| TV Dramas                |    763 |
| Independent Movies       |    756 |
| Children & Family Movies |    641 |
| Romantic Movies          |    616 |
| TV Comedies              |    581 |
| Thrillers                |    577 |
| Crime TV Shows           |    470 |
| Kids’ TV                 |    451 |
| Docuseries               |    395 |

### Business Insight 1: International Movies Has the Largest Representation

International Movies is the largest genre category, with 2,752 titles.
This indicates substantial representation of international movie content
in the catalog.

### Business Insight 2: Dramas Is the Second-Largest Genre

Dramas ranks second with 2,427 titles. Together, International Movies
and Dramas are the two most represented genre categories.

### Business Insight 3: The Catalog Includes Multiple Content Types

Comedies, International TV Shows, Documentaries, and Action & Adventure
also have substantial representation. This shows that the catalog covers
a range of genre categories.

Genre counts are not mutually exclusive because a title can belong to
more than one genre. These counts measure catalog representation, not
viewing popularity or genre performance.

## 5. Content Rating Analysis

### Analytical Rating Classification

| Rating Category   |    Titles |       Share |
|:------------------|----------:|------------:|
| Mature            |     4,009 |      45.52% |
| Teens             |     2,650 |      30.09% |
| Older Kids        |     1,490 |      16.92% |
| Little Kids       |       527 |       5.98% |
| Unrated / Unknown |       131 |       1.49% |
| **Total**         | **8,807** | **100.00%** |

### Business Insight 1: Mature Is the Largest Analytical Group

Mature represents 4,009 titles, or approximately 45.52% of the catalog.
It is the largest group under the rating classification developed for
this analysis.

### Business Insight 2: Teens Is the Second-Largest Group

The Teens category contains 2,650 titles (30.09%), followed by Older
Kids with 1,490 titles (16.92%).

### Business Insight 3: Little Kids Has a Smaller Catalog Share

Little Kids represents 527 titles (5.98%). This is a smaller share than
the other classified groups.

The rating groups are analytical groupings created for this project.
They are not an official unified Netflix classification, and they do not
identify the actual age or demographics of viewers.

## 6. Release Year Analysis

### Release Timeline

| Metric                | Value |
|:----------------------|------:|
| Earliest Release Year |  1925 |
| Average Release Year  |  2014 |
| Latest Release Year   |  2021 |

### Business Insight

The catalog includes titles released across a long period, from 1925 to
2021. The average release year is 2014, indicating that the catalog’s
release-year distribution is centered in the more recent period.

The release year represents when a title was originally released, not
when it was added to Netflix. These two dates should be analyzed
separately.

## 7. Netflix Catalog Addition Trends

### Top Years by Content Addition

| Year Added | Titles |
|:-----------|-------:|
| 2019       |  2,016 |
| 2020       |  1,879 |
| 2018       |  1,649 |
| 2021       |  1,498 |
| 2017       |  1,188 |
| 2016       |    429 |
| 2015       |     82 |
| 2014       |     24 |
| 2011       |     13 |
| 2013       |     11 |

### Business Insight 1: Significant Increase in Catalog Additions

Content additions increased substantially between 2016 and 2019, rising
from 429 titles in 2016 to 2,016 titles in 2019.

### Business Insight 2: 2019 Was the Peak Year

The year 2019 recorded the highest number of content additions in the
dataset, with 2,016 titles. The next highest year was 2020, with 1,879
titles.

### Business Insight 3: Additions Declined After 2019

The number of additions declined from 2,016 in 2019 to 1,498 in 2021.
This describes the observed pattern in the dataset; the reasons for the
decline cannot be established from catalog metadata alone.

These figures are based on valid `date_added` values and represent
catalog additions, not production or investment activity.

## 8. Monthly Content Addition Pattern

### Top Months

| Month     | Titles Added |
|:----------|-------------:|
| July      |          827 |
| December  |          813 |
| September |          770 |
| October   |          760 |

### Business Insight

July recorded the highest number of content additions, with 827 titles,
followed by December with 813 titles. September and October also
recorded relatively high counts.

This indicates that content additions were more concentrated in these
months in the observed dataset. The data does not establish a
relationship with holidays, seasonal viewing behavior, or audience
engagement.

## 9. Movie Duration Analysis

### Movie Duration Distribution

| Duration              |    Titles |
|:----------------------|----------:|
| 60 minutes or less    |       487 |
| 61–90 minutes         |     1,506 |
| 91–120 minutes        |     2,996 |
| More than 120 minutes |     1,142 |
| **Total**             | **6,131** |

### Additional Metrics

| Metric                 |         Value |
|:-----------------------|--------------:|
| Average Movie Duration | 99.56 minutes |
| Median Movie Duration  |    98 minutes |
| Minimum Duration       |     3 minutes |
| Maximum Duration       |   312 minutes |

### Business Insight 1: The 91–120 Minute Group Is the Largest

The 91–120-minute category contains 2,996 titles, representing
approximately 48.9% of all Movies. It is the largest duration group in
the catalog.

### Business Insight 2: Movie Durations Are Concentrated Around 1.5–2 Hours

The average movie duration is approximately 99.56 minutes, while the
median is 98 minutes. Half of the movies fall between 87 and 114
minutes.

These statistics describe the duration profile of the catalog. They do
not establish an ideal duration or a viewer preference.

## 10. TV Show Season Analysis

### Season Distribution

| Season Count |  TV Shows |
|:-------------|----------:|
| 1 Season     |     1,793 |
| 2 Seasons    |       425 |
| 3 Seasons    |       199 |
| 4 Seasons    |        95 |
| 5+ Seasons   |       164 |
| **Total**    | **2,676** |

### Additional Metrics

| Metric                   | Value |
|:-------------------------|------:|
| Average TV Show Seasons  |  1.76 |
| Median TV Show Seasons   |     1 |
| Most Common Season Count |     1 |
| Maximum Season Count     |    17 |

### Business Insight 1: One-Season TV Shows Dominate

A total of 1,793 TV Shows have one season, representing approximately
67% of all TV Shows in the dataset.

### Business Insight 2: Most TV Shows Have No More Than Two Seasons

The one-season and two-season groups together contain 2,218 titles, or
approximately 82.9% of TV Shows. This indicates that the catalog is
dominated by titles with relatively few seasons.

A one-season title cannot automatically be classified as a limited
series. The dataset does not indicate whether a show was completed,
renewed, or cancelled.

## 11. Content Format Characteristics

### Movie and TV Show Characteristics

| Content Type | Metric           |         Value |
|:-------------|:-----------------|--------------:|
| Movie        | Average Duration | 99.56 minutes |
| TV Show      | Average Seasons  |  1.76 seasons |

### Business Insight

Movies and TV Shows have different format characteristics in the
catalog. Movies are described by their running time, while TV Shows are
described by their number of seasons.

These measures should be interpreted separately because they use
different units. The dataset does not contain completion rates, watch
time, binge-watching behavior, or viewer fatigue indicators.

------------------------------------------------------------------------

## 12. Executive Business Conclusions

1.  **Movie-Dominated Catalog:** Movies represent 69.62% of the 8,807
    titles, compared with 30.38% for TV Shows.
2.  **Broad Geographic Representation:** The catalog contains titles
    associated with 122 countries, with the United States contributing
    the largest number.
3.  **Genre Concentration:** International Movies and Dramas are the two
    largest genre categories by title count.
4.  **Rating Distribution:** Mature is the largest analytical rating
    group, representing approximately 45.52% of the catalog.
5.  **Catalog Addition Peak:** 2019 recorded the highest number of
    additions, with 2,016 titles.
6.  **Movie Duration Profile:** The 91–120-minute category is the
    largest movie duration group.
7.  **TV Show Season Profile:** Approximately 67% of TV Shows have one
    season, and approximately 82.9% have no more than two seasons.

## 13. Analysis Limitations

This project uses Netflix catalog metadata. The dataset does not
include:

- Number of views or viewing hours.
- Audience completion rates or engagement.
- Subscriber counts or customer demographics.
- Revenue, profit, production budgets, or acquisition costs.
- Content renewal, cancellation, or licensing decisions.
- Country-level demand or market performance.

Therefore, the findings describe catalog composition and addition
patterns. They should not be presented as direct evidence of Netflix’s
internal strategy, audience preferences, or commercial performance.
