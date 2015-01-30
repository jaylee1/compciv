mkdir -p data-hold
cd data-hold
curl -s http://www.tdcj.state.tx.us/death_row/dr_offenders_on_dr.html > texasdr.html
curl -s http://www.tdcj.state.tx.us/death_row/dr_list_all_dr_1923-1973.html > texasdr2373.html
curl -s http://www.dc.state.fl.us/activeinmates/deathrowroster.asp > fladr.html
curl -s http://www.dc.state.fl.us/oth/deathrow/execlist.html > fla76.html
curl -s http://www.dc.state.fl.us/oth/deathrow/execlist2.html > fla2464.html
curl -s http://www.cdcr.ca.gov/capital_punishment/docs/condemnedinmatelistsecure.pdf > calidr.pdf
