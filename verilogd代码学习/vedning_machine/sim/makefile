all: clean elab run verdi

elab: 
	vcs \
		-f files.f\
		-timescale=1ns/1ps\
		-full64 -R +vc +v2k -sverilog -debug_access+all\
		-l vcs.log
run :	
	./simv -ucli -i run.tcl -l run.log &

verdi :
	verdi -f files.f -ssf tb.fsdb &

clean: 
	rm -rf *~ core csrc simv* vc_hdrs.h ucli.key urg* *.log novas.* *.fsdb verdiLog 64* DVEfiles *.vpd
