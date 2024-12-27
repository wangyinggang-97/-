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

#define  FV_ERROR_NUM_1 0x01   //�洢�ļ���ʧ��
#define  FV_ERROR_NUM_2 0x02   //����δ����
#define  FV_ERROR_NUM_3 0x03   //ָѹ״̬��������ʧ��
#define  FV_ERROR_NUM_4 0x04   //��֧�ָ÷ֱ���
#define  FV_ERROR_NUM_5 0x05   //�����ع�ʧ��
#define  FV_ERROR_NUM_6 0x06   //��ȡͼ��ʧ��
#define  FV_ERROR_NUM_7 0x07   //�򿪵�ʱ��û���ҵ������豸
#define  FV_ERROR_NUM_8 0x08   //�豸��ʧ��
#define  FV_ERROR_NUM_9 0x09   //����Ϊ��
#define  FV_ERROR_NUM_A 0x0A   //�ȶ���������Ϊ��
#define  FV_ERROR_NUM_B 0x0B   //ͼ���С��ƥ��
#define  FV_ERROR_NUM_C 0x0C
#define  FV_ERROR_NUM_D 0x0D   //ģ�峤�ȴ���
#define  FV_ERROR_NUM_E 0x0E   //ģ�����
#define  FV_ERROR_NUM_10 0x10  //��������
#define  FV_ERROR_NUM_11 0x11  //�ع��ʱ����ָû�зź�
#define  FV_ERROR_NUM_FE 0xFE  //����ָ��Ϊ��
#define  FV_ERROR_NUM_FF 0xFF  //����

#define  FV_ERROR_NUM_M1  1001     //1001 �㷨��δ��ʼ��
#define  FV_ERROR_NUM_M2  1002     //1002 ��ȡʧ��
#define  FV_ERROR_NUM_M3  3002     //3002 ����ͼ�����
#define  FV_ERROR_NUM_M4  2001     //2001��Bad Quality with too many pressure
#define  FV_ERROR_NUM_M5  2002     //2002��ROI Not Find
#define  FV_ERROR_NUM_M6  2003     //2003��Light Leak
#define  FV_ERROR_NUM_M7  2004	   // ©��
#define  FV_ERROR_NUM_M8  2005	   // ©��
#define  FV_ERROR_NUM_M9  2006	   // ©��
#define  FV_ERROR_NUM_M10 2007	   // ��������

#pragma pack(push, 1)
typedef struct
{
	WORD SdkVer;		//SDK�汾 BCD
	WORD SdkYear;		//SDK��� BCD
	WORD SdkDate;		//SDK���� BCD
	WORD FwVer;			//�̼��汾 BCD
	WORD FwYear;		//�̼���� BCD
	WORD FwDate;		//�̼����� BCD
	WORD UsbVendor;		//USB����ID
	WORD UsbProduct;	//USB�豸ID
	WORD UsbVersion;	//USB�汾ID
	BYTE DevType;		//�豸���� 0x01:���� 0x02:˫�� 0x03:���� 0x10:ָ�� 0x12:����
	BYTE DevRes;		//CMOS�ֱ��� 30��VGA 130:SXGA
	WORD SensorId;		//CMOSʶ��ID 0x8243:MT9V011 0x8431:MT9M001 0x2282:MT9V117
	BYTE SensorClock;	//CMOS MCLKʱ�ӣ�MHz��
	WORD Width;			//CMOS������ 640 | 1280
	WORD Height;		//CMOS����߶� 480 | 1024
	WORD MaxExp;		//CMOS����ع� 4096 | 8192
	WORD MaxGain;		//CMOS������� 128 | 64
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
	// ��ȡ��ǰ�����豸����
	MDAPI BOOL MDCALL fvdev_get_count(OUT int *count);
	// ���豸
	MDAPI BOOL MDCALL fvdev_open(IN int devno, IN HWND hwnd);
	// �رյ�ǰ�豸
	MDAPI BOOL MDCALL   fvdev_close();

	// ��ȡ��ָ״̬ ��ѹ(0x03)״̬
	MDAPI BOOL MDCALL  fvdev_get_state(OUT int *state);

	// ��ȡ����ͼ
	MDAPI BOOL  MDCALL  fvdev_grab(OUT unsigned char *img, OUT int *len);

	// ��������
	MDAPI BOOL MDCALL  fv_quality(IN unsigned char *img, IN int len, OUT int *avg,OUT int *q);

	// ����ģ��
	MDAPI BOOL MDCALL   fv_extract_model(BYTE *picData1,int picLen1,BYTE*picData2,int picLen2,BYTE*picData3,int picLen3,BYTE *model,int *modelLen);
	// 1:N�Ƚ�
	MDAPI BOOL MDCALL   fv_index(unsigned char *models, int count,BYTE*img,int imgLen, int *pos,float *getscore);
	// 1:1�Ƚ�
	MDAPI BOOL MDCALL   fv_match(unsigned char *img, int imgLen, unsigned char*model, float *threshold);

	// ����ģ���
	MDAPI  BOOL MDCALL   fv_load_model(const char *modelPath, int *num);

	// �����û�
	MDAPI  BOOL MDCALL fv_user_index(unsigned char *img, int len,int *indexID,float threshold,float *score,BOOL bUpdate);
	// ����û�
	MDAPI  BOOL MDCALL fv_user_add(BYTE *picData1,int picLen1,BYTE*picData2,int picLen2,BYTE*picData3,int picLen3, unsigned int *indexID);
	// ɾ���û�
	MDAPI  BOOL MDCALL fv_user_del(IN unsigned int indexID);
	
	// ����ָʾ��
	MDAPI BOOL MDCALL   fvdev_set_led(int Color, BOOL  bFlush);

	// �豸�Ƿ��Ѵ�
	MDAPI BOOL MDCALL   isDevOpen();

	MDAPI BOOL MDCALL  fvdev_set_buzzer(BYTE one_time,BYTE repeat_cnt);

	// �򿪱�����
	MDAPI BOOL MDCALL  fvdev_openBackLight();

	MDAPI BOOL MDCALL  fvdev_expose(int avg, int *exp1);

	// �����豸���
	MDAPI BOOL MDCALL  fvdev_setno(IN int no);
	// ��ȡ�豸���
	MDAPI BOOL MDCALL  fvdev_getno(OUT int* no);

	// ��ȡĬ����ֵ
	MDAPI BOOL MDCALL fv_get_default_threshold(float *score);
	MDAPI BOOL MDCALL drawFingerVein(HDC  hdc, unsigned char *img, int len, RECT rcSrc, RECT rcDst);
	MDAPI BOOL MDCALL fv_isEncry(unsigned char* img, int len);
	MDAPI BOOL MDCALL fvdev_setpara();
	MDAPI BOOL MDCALL fv_Get_Error(int *error);

	// ��ȡ��ǰ��İ汾��Ϣ
	MDAPI BOOL MDCALL fv_Get_Edition(OUT int *buf);
	// ��ȡ��ǰ�豸�Ĳ�����Ϣ
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

