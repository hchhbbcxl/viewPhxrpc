#include "config.h"
#include <iostream>
#include "string.h"

using namespace std;


int main(int argc,char *argv[])
{
	phxrpc::Config cc;
	char bac[23] = " sd dd f  ";
	cc.InitConfig("~/phxrpc/test.txt");
	cout << "before size=" << strlen(bac) << endl;
	cout << "before bac=" << bac << endl;

	cc.TrimCStr(bac);

	cout << "bac size=" << strlen(bac) << endl;
	cout << "bac=" << bac << endl;

	int value;
	const char *sec = "server";
	const char *key = "uid";
	cc.ReadItem(sec,key,&value);

	cout << "value=" << value << endl;

	vector<string> secs;
	cc.GetSection("client",&secs);
	vector<string>::iterator it;
	cout << "vector<string> :" << endl;
	for(it=secs.begin();it < secs.end();++it){
		cout << *it << endl;
	}

	


	return 0;
}
