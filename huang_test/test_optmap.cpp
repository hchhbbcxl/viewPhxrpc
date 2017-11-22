#include "opt_map.h"
#include <iostream>

using namespace std;
using namespace phxrpc;

int main(int argc,char *argv[])
{
	OptMap opt("npsq");
	opt.Parse(argc,argv);
	OptMap::option_map_::iterator itopt = opt.opt_.begin();
	for(;itopt != opt.opt_.end();itopt++){
		cout << itopt->first << endl;
		cout << itopt->second.size() << endl;
	}
}
