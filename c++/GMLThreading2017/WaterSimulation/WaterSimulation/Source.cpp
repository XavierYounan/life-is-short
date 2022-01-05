
#include "pch.h"


#include <thread>
#include <chrono>
#include <vector>
#include <mutex>





#define gmx extern "C" __declspec (dllexport)

using ds_map = int;
using thread = std::thread;
using milliseconds = std::chrono::milliseconds;

const int EVENT_OTHER_SOCIAL = 70;

void(*gml_event_perform_async)(ds_map map, int event_type) = nullptr;
int(*gml_ds_map_create)(int n, ...) = nullptr;
bool(*gml_ds_map_add_double)(ds_map map, const char* key, double value);
bool(*gml_ds_map_add_string)(ds_map map, char* key, char* value);

std::mutex thread_key;

std::vector<thread*> threads;
std::vector<uint32_t> open_slots;

gmx double RegisterCallbacks(char* arg1, char* arg2, char* arg3, char* arg4) {
	gml_event_perform_async = (void(*)(ds_map, int))arg1;
	gml_ds_map_create = (int(*)(int, ...))arg2;
	gml_ds_map_add_double = (bool(*)(ds_map, const char*, double))arg3;
	gml_ds_map_add_string = (bool(*)(ds_map, char*, char*))arg4;

	return 0;
}


ds_map ds_map_create() {
	return gml_ds_map_create(0);

}

void return_double(double time, double type, double value, int handle) {
	long t = (long)time;
	std::this_thread::sleep_for(milliseconds(t));

	thread_key.lock();

	ds_map map = ds_map_create();
	gml_ds_map_add_double(map, "type", type);
	gml_ds_map_add_double(map, "value", value);
	gml_ds_map_add_double(map, "handle", handle);
	gml_event_perform_async(map, EVENT_OTHER_SOCIAL);


	thread_key.unlock();


}

gmx double thread_create(double time, double type, double value) {
	int index;

	thread_key.lock();

	if (open_slots.empty()) {
		index = threads.size();
		threads.push_back(new thread(return_double, time, type, value, index));
	}
	else {
		index = open_slots.back();
		open_slots.pop_back();
		threads[index] = new thread(return_double, time, type, value, index);
	}

	thread_key.unlock();

	return index;
}

gmx double thread_kill(double index) {
	thread_key.lock();

	if (threads.size() > index && threads[index] != NULL) {
		if (threads[index]->joinable()) {
			threads[index]->detach();
		}
		delete threads[index];
		threads[index] = NULL;
		open_slots.push_back(index);
	}

	thread_key.unlock();

	return 1;
}

gmx double thread_free(double index) {
	thread_key.lock();

	if (threads.size() > index && threads[index] != NULL) {
		if (threads[index]->joinable()) {
			threads[index]->detach();
		}
		delete threads[index];
		threads[index] = NULL;
		open_slots.push_back(index);
	}

	thread_key.unlock();

	return 1;
}
