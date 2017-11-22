#include "file_utils.h"
#include <iostream>
#include <string>

using namespace std;

int main(int argc,char *argv[])
{
	string res;
	phxrpc::FileUtils::ReadFile("~/phxrpc/test.txt",&res);
	cout << "result: " << res << endl;
	return 0;
}
