#pragma once
//using std::string;

extern "C" int64_t getAvailableDiskSpace(const char *path);
extern "C" int64_t getFreeDiskSpace(const char* path);
extern "C" int64_t getDiskCapacity(const char* path);
extern "C" int64_t empty(const char *path);
