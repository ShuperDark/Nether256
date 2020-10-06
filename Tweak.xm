#include "substrate.h"
#include <string>
#include <cstdio>
#include <mach-o/dyld.h>
#include <cstdint>
#include <stdint.h>

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

template<typename A, typename T>
class AutomaticID {

	T id;
public:
	AutomaticID() {
		id = 0;
	}
	AutomaticID(T x) {
		id = x;
	}
	operator T() {
		return id;
	}
};

struct Dimension;

static Dimension*(*Dimension_Dimension)(Dimension*, uintptr_t&, AutomaticID<Dimension, int>, short, uintptr_t&, std::string);
static Dimension* _Dimension_Dimension(Dimension* self, uintptr_t& level, AutomaticID<Dimension, int> automaticid, short s1, uintptr_t& scheduler, std::string str1) {

	//If it is larger than 256, it will crash
	return Dimension_Dimension(self, level, automaticid, 256, scheduler, str1);
}

%ctor {
	MSHookFunction((void*)(0x102ca3988 + _dyld_get_image_vmaddr_slide(0)), (void*)&_Dimension_Dimension, (void**)&Dimension_Dimension);
}