california=$(bash ca-dr.sh | sed s/OTH/Other/ | sed s/BLA/Black/ | sed s/WHI/White/ | sed s/HIS/Hispanic/)
for x in $california; do echo 'CA,'$x; done
florida=$(bash fl-dr.sh | sed s/WM/White/ | sed s/BM/Black/ | sed s/HM/Hispanic/ | sed s/OM/Other/ | sed s/BF/Black/ | sed s/WF/White/ | sed s/HF/Hispanic/)
for y in $florida; do echo 'FLA,'$y; done
texas=$(bash tx-dr.sh) 
for z in $texas; do echo 'TX,'$z; done
