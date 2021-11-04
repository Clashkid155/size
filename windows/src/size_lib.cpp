#include <filesystem>
#include <iostream>
#include "size_lib.h"
namespace fs = std::filesystem;

//using std::endl;
using std::string;
//using std::to_string;

int64_t getAvailableDiskSpace(const char *path)
{ // Returns the root diskspace
    string s = string(path).c_str();
    if (fs::exists(s))
    {

        fs::space_info size = fs::space(s);

        return size.available;
    }//int64_t err = -1;
    return -1;
}
int64_t getFreeDiskSpace(const char *path)
{ // Returns the custom disk free space
    string s = string(path).c_str();
    if (fs::exists(s))
    {

        fs::space_info size = fs::space(s);
        return size.free;
    }
    //int64_t err = -1;
    return -1;
    //return size.free;
}
int64_t getDiskCapacity(const char *path)
{ // Returns the custom diskcapacity
    string s = string(path).c_str();
    if (fs::exists(s))
    {
        fs::space_info size = fs::space(path);
        //return to_string(size.capacity);
        return size.capacity;
    }
    //int64_t err = -1;
    return -1;
}
int64_t empty(const char *path)
{
    string s = string(path).c_str();
    if (fs::exists(s))
    {
        if (fs::is_empty(s) == 1 || fs::is_empty(s) == true)
        {
            return 1; // is not empty
        }
        else
        {
            return 0; //Is empty
        }
    }
    else
    {
        return -1;
    }
}

int main() {
    return 0;
}
