# RfA-analysis
See "News and Notes" from May 2020 issue of [*The Signpost*](https://en.wikipedia.org/wiki/Wikipedia:Wikipedia_Signpost) on Wikipedia for details

Main findings are in reports/allyears.wiki after you invoke `main.sh` and duplicate entries are in reports/allyears.duplicates.

A more detailed duplicates report can be generated with `report-dup-2.sh`. It assumes the diffs have been generated previously by `fetch-diff.sh`, which is invoked by `main.sh` or can be invoked manually with the first parameter the year of interest. You may need to adjust the scripts to make sure years generated/reported are coherent.