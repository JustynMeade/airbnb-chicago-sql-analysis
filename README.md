# Chicago Airbnb Market Analysis

A project where I wrote SQL queries to dig into 8,600+ Chicago Airbnb listings and
answer questions about pricing, reviews, demand, and hosts.

## Tools
SQL (SQLite)

## Questions I answered
1. Which neighborhoods have the highest average price?
2. Which neighborhoods get the best reviews?
3. What room type gets the best reviews?
4. Which neighborhood has the most demand (lowest availability)?
5. What's the price difference between entire homes and private rooms?
6. Which hosts have the most listings — are they commercial operators?
7. What factors predict a higher review score?
8. What percentage of listings are available year-round?

## What I did
- Worked with a `price` column stored as text (like "$1,200.00") and had to clean
  and convert it to a number before I could run any averages
- Grouped and sorted listings by neighborhood, room type, and host to compare them
- Noticed some hotel room listings had prices as high as $50,000, which were
  throwing off the averages, so I added a filter to remove them
- Used `CASE WHEN` to bucket listings into fully available, fully booked, and
  partially available groups

## Key findings
- Near North Side has the highest average price ($2,925/night, 1,000+ listings),
  followed by Loop ($1,502/night). Most other neighborhoods are in the $180-290 range
- Review scores are all pretty close across neighborhoods (4.85-4.96) — the highest
  ones just have very few listings, so they're not that reliable
- Entire home/apt listings cost about 3x more than private rooms ($247 vs $83/night)
  and also get slightly better reviews
- The top host by listing count (612 listings) had no name attached — probably a
  data issue. The next two biggest hosts look like companies, not individual people
- 92% of listings are only partially booked throughout the year, meaning most hosts
  are actively managing bookings rather than leaving properties empty or always full

## Skills used
SQL (aggregation, GROUP BY, CASE WHEN), data cleaning, outlier handling

## Files
- `queries.sql` — all 8 queries
- `SQL Questions.pdf` — queries, outputs, and full analysis for each question
