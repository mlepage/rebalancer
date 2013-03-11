
-- MoneySense Couch Potato Portfolio
-- http://www.moneysense.ca/2006/04/05/couch-potato-portfolio-how-to-set-it-up/

-- Using the following TD e-series index funds:
-- TD Canadian Index
-- TD U.S. Index
-- TD International Index
-- TD Canadian Bond Index

classic_couch_potato =
{
    { 'Canadian equity', 1/3 },
    { 'U.S. equity', 1/3 },
    { 'Canadian bond', 1/3 },
}

global_couch_potato =
{
    { 'Canadian equity', 1/5 },
    { 'U.S. equity', 1/5 },
    { 'International equity', 1/5 },
    { 'Canadian bond', 2/5 },
}

high_growth_couch_potato =
{
    { 'Canadian equity', 1/4 },
    { 'U.S. equity', 1/4 },
    { 'International equity', 1/4 },
    { 'Canadian bond', 1/4 },
}

higher_growth =
{
    { 'Money market', 0/10 },
    { 'Canadian equity', 3/10 },
    { 'U.S. equity', 3/10 },
    { 'International equity', 3/10 },
    { 'Canadian bond', 1/10 },
}

target_allocation = higher_growth
min_trade = 100
