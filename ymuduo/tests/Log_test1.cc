#include <muduo/base/Logging.h>
#include <errno.h>

using namespace muduo;

int main()
{
	LOG_TRACE<<"trace...";
	LOG_DEBUG<<"DEBUG...";
	LOG_INFO<<"INFO...";
	LOG_WARN<<"WARN...";
	LOG_ERROR<<"ERROR...";
	errno = 13;
	LOG_SYSERR<<"SYSERR...";
	return 0;
}
