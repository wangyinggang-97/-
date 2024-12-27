#ifndef  __FINGERVEINDLL_H__
#define __FINGERVEINDLL_H__

#include <atlimage.h>
#include "opencv2/opencv.hpp"
#include "FingerVeinDevice.h"	

#include "fvdevLib.h"
#include "AutoLock.h"	

#include <vector>
#include <string>

using std::vector;
using std::string;


#ifdef MDDLL_EXPORTS
#define MDAPI __declspec(dllexport)
#else
#define MDAPI __declspec(dllimport)
#endif

#define MDCALL __stdcall
#define IN 
#define OUT
#define INOUT

#define  FV_ERROR_NUM_1 0x01   //存储文件打开失败
#define  FV_ERROR_NUM_2 0x02   //函数未启动
#define  FV_ERROR_NUM_3 0x03   //指压状态函数调用失败
#define  FV_ERROR_NUM_4 0x04   //不支持该分辨率
#define  FV_ERROR_NUM_5 0x05   //设置曝光失败
#define  FV_ERROR_NUM_6 0x06   //获取图像失败
#define  FV_ERROR_NUM_7 0x07   //打开的时候没有找到可用设备
#define  FV_ERROR_NUM_8 0x08   //设备打开失败
#define  FV_ERROR_NUM_9 0x09   //数据为空
#define  FV_ERROR_NUM_A 0x0A   //比对数据内容为空
#define  FV_ERROR_NUM_B 0x0B   //图像大小不匹配
#define  FV_ERROR_NUM_C 0x0C
#define  FV_ERROR_NUM_D 0x0D   //模板长度错误
#define  FV_ERROR_NUM_E 0x0E   //模板错误
#define  FV_ERROR_NUM_10 0x10  //参数错误
#define  FV_ERROR_NUM_11 0x11  //曝光的时候手指没有放好
#define  FV_ERROR_NUM_FE 0xFE  //函数指针为空
#define  FV_ERROR_NUM_FF 0xFF  //其他

#define  FV_ERROR_NUM_M1  1001     //1001 算法库未初始化
#define  FV_ERROR_NUM_M2  1002     //1002 提取失败
#define  FV_ERROR_NUM_M3  3002     //3002 输入图像错误
#define  FV_ERROR_NUM_M4  2001     //2001：Bad Quality with too many pressure
#define  FV_ERROR_NUM_M5  2002     //2002：ROI Not Find
#define  FV_ERROR_NUM_M6  2003     //2003：Light Leak
#define  FV_ERROR_NUM_M7  2004	   // 漏光
#define  FV_ERROR_NUM_M8  2005	   // 漏光
#define  FV_ERROR_NUM_M9  2006	   // 漏光
#define  FV_ERROR_NUM_M10 2007	   // 能量过低

#pragma pack(push, 1)
typedef struct
{
	WORD SdkVer;		//SDK版本 BCD
	WORD SdkYear;		//SDK年份 BCD
	WORD SdkDate;		//SDK日期 BCD
	WORD FwVer;			//固件版本 BCD
	WORD FwYear;		//固件年份 BCD
	WORD FwDate;		//固件日期 BCD
	WORD UsbVendor;		//USB厂商ID
	WORD UsbProduct;	//USB设备ID
	WORD UsbVersion;	//USB版本ID
	BYTE DevType;		//设备类型 0x01:单侧 0x02:双侧 0x03:顶侧 0x10:指纹 0x12:复合
	BYTE DevRes;		//CMOS分辨率 30：VGA 130:SXGA
	WORD SensorId;		//CMOS识别ID 0x8243:MT9V011 0x8431:MT9M001 0x2282:MT9V117
	BYTE SensorClock;	//CMOS MCLK时钟（MHz）
	WORD Width;			//CMOS输出宽度 640 | 1280
	WORD Height;		//CMOS输出高度 480 | 1024
	WORD MaxExp;		//CMOS最大曝光 4096 | 8192
	WORD MaxGain;		//CMOS最大增益 128 | 64
} DEVINFO, *PDEVINFO;
#pragma pack(pop)


typedef  unsigned char   md_u8;		
typedef  unsigned short  md_u16;	
typedef  unsigned int    md_u32;

#define ROI_TOP			60
#define ROI_HEIGHT      120
#define ROI_LEFT	    50
#define ROI_WIDTH       (320-ROI_LEFT-50)


#define   FV_VERSION       7

#define  FV_MATCH_Auth 0.6		

#define IMG__WIDTH		320
#define IMG__HEIGHT		240
#define IMG__SIZE		76800

enum FV_DEVICE_TYPE
{
	FV_DEVICE_UNKNOW,
	MD110_JD,
	MD110_0308,
	MD130_0308,
	MD138_0308,
	MD_220
};

enum  FV_IMAGE_DIR
{
	FV_RAW,
	FV_STANDARD,       
};

#pragma pack (1)
union  app_module_version
{
	struct{
		unsigned char m;
		unsigned char s;
	};
	short ver;
};

struct  md110_configure_info
{
	short  sig;		
	app_module_version version;
	int device_type;
	int LowThreshold;
	int HighThreshold;
	int devno;	

	int  avg;	
	int  devImageWidth;
	int  devImageHeight;
	int  image_direction; 
	int   sessor;
	int   defaultSessor;
	unsigned char   onLight[8];
	unsigned char   offLight[8];
	float fLeakRatioThreshold;
	float fPressThreshold;
	float mathAuth;	
	float sameFinger;
	float tiaozheng[4];

	int   end_sig;
};

#pragma pack ()


struct  list_frame_data
{
	unsigned int     timeGrab;
	unsigned char    data[IMG__SIZE];
	volatile bool    bOk;	
};

struct run_dev_info;	

extern run_dev_info* current_RunDev;

BOOL isFingerOn(void *handle);	

void MatToCImage(cv::Mat& mat, CImage& cimage);

int  getAverage(unsigned char *img,int gray[256]);	


BOOL MDCALL fvdev_open_ex(int devno, HWND hwnd,void **phandle);	

BOOL MDCALL  fvdev_openBackLight_ex(void *handle);


BOOL MDCALL  fvdev_expose_ex(run_dev_info *rdi,int avg, int *exp1);

 BOOL MDCALL  fvdev_setIdentifyStatus(int status);


BOOL MDCALL  fvdev_get_state_ex(void *handle,int *state);

BOOL  getFrame(run_dev_info *rdi,void *img);


BOOL  MDCALL  fvdev_closeBackLight_ex(void *handle);

BOOL  MDCALL fvdev_set_buzzer_ex(void *handle,BYTE one_time,BYTE repeat_cnt);

void drawImage(HDC hdc,VOID* imgBits,RECT rcDst,RECT rcSrc);


void dbg_print(int level, const char *fmt, ...);

int writeusb(unsigned char* buf, unsigned short len);

int readusb(unsigned char* buf, unsigned short len);



#define DECLAR_VERSION(main,sub)  int module_version=((md_u16)(((md_u8)(((md_u32)(sub)) & 0xff)) | ((md_u16)((md_u8)(((md_u32)(main)) & 0xff))) << 8))
#define SUBVERSION(v)          ((md_u8)(((md_u32)(v)) & 0xff))	
#define MAINVERSION(N)           ((md_u8)((((md_u32)(N)) >> 8) & 0xff))		


#ifdef __cplusplus
extern "C" 
{
#endif
	// 获取当前可用设备个数
	MDAPI BOOL MDCALL fvdev_get_count(OUT int *count);
	// 打开设备
	MDAPI BOOL MDCALL fvdev_open(IN int devno, IN HWND hwnd);
	// 关闭当前设备
	MDAPI BOOL MDCALL   fvdev_close();

	// 获取手指状态 按压(0x03)状态
	MDAPI BOOL MDCALL  fvdev_get_state(OUT int *state);

	// 获取编码图
	MDAPI BOOL  MDCALL  fvdev_grab(OUT unsigned char *img, OUT int *len);

	// 质量评估
	MDAPI BOOL MDCALL  fv_quality(IN unsigned char *img, IN int len, OUT int *avg,OUT int *q);

	// 建立模板
	MDAPI BOOL MDCALL   fv_extract_model(BYTE *picData1,int picLen1,BYTE*picData2,int picLen2,BYTE*picData3,int picLen3,BYTE *model,int *modelLen);
	// 1:N比较
	MDAPI BOOL MDCALL   fv_index(unsigned char *models, int count,BYTE*img,int imgLen, int *pos,float *getscore);
	// 1:1比较
	MDAPI BOOL MDCALL   fv_match(unsigned char *img, int imgLen, unsigned char*model, float *threshold);

	// 载入模板库
	MDAPI  BOOL MDCALL   fv_load_model(const char *modelPath, int *num);

	// 查找用户
	MDAPI  BOOL MDCALL fv_user_index(unsigned char *img, int len,int *indexID,float threshold,float *score,BOOL bUpdate);
	// 添加用户
	MDAPI  BOOL MDCALL fv_user_add(BYTE *picData1,int picLen1,BYTE*picData2,int picLen2,BYTE*picData3,int picLen3, unsigned int *indexID);
	// 删除用户
	MDAPI  BOOL MDCALL fv_user_del(IN unsigned int indexID);
	
	// 设置指示灯
	MDAPI BOOL MDCALL   fvdev_set_led(int Color, BOOL  bFlush);

	// 设备是否已打开
	MDAPI BOOL MDCALL   isDevOpen();

	MDAPI BOOL MDCALL  fvdev_set_buzzer(BYTE one_time,BYTE repeat_cnt);

	// 打开背景灯
	MDAPI BOOL MDCALL  fvdev_openBackLight();

	MDAPI BOOL MDCALL  fvdev_expose(int avg, int *exp1);

	// 设置设备编号
	MDAPI BOOL MDCALL  fvdev_setno(IN int no);
	// 获取设备编号
	MDAPI BOOL MDCALL  fvdev_getno(OUT int* no);

	// 获取默认阈值
	MDAPI BOOL MDCALL fv_get_default_threshold(float *score);
	MDAPI BOOL MDCALL drawFingerVein(HDC  hdc, unsigned char *img, int len, RECT rcSrc, RECT rcDst);
	MDAPI BOOL MDCALL fv_isEncry(unsigned char* img, int len);
	MDAPI BOOL MDCALL fvdev_setpara();
	MDAPI BOOL MDCALL fv_Get_Error(int *error);

	// 获取当前库的版本信息
	MDAPI BOOL MDCALL fv_Get_Edition(OUT int *buf);
	// 获取当前设备的参数信息
	MDAPI BOOL MDCALL fv_Get_Dev_Info(OUT PDEVINFO buf);

	// 
	MDAPI BOOL MDCALL fv_extrace_match_feature(BYTE*img,int imgLen,BYTE *matchFeature, int *mfLen);
	// 
	MDAPI BOOL MDCALL fv_index_matchfeature(unsigned char *models, int count,BYTE*matchFeautre,int mfLen, int *pos,float *threshold);

	MDAPI BOOL MDCALL  fv_getJpg(IN unsigned char *img, IN int len,OUT unsigned char *jpgbuf);

	MDAPI BOOL MDCALL setDebugLevel(IN int level);
#ifdef __cplusplus
}
#endif

#endif

