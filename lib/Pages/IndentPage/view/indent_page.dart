import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:project/Pages/IndentPage/controller/indent_controller.dart';
import 'package:project/routes/app_routes.dart';
import 'package:project/theme/app_theme.dart';
import 'package:project/widgets/done_btn.dart';
import 'package:project/widgets/primary_btn.dart';

class IndentPage extends GetView<IndentController> {
  const IndentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: controller.regfirstStep.value == true
      //     ? BottomAppBar(
      //         color: AppTheme.whiteColor,
      //         child: InkWell(
      //           onTap: () => controller.buttonSubmit(context),
      //           child: DoneBtn(btnText: 'Register In'),
      //         ),
      //       )
      //     : null,
      backgroundColor: const Color(0xfff8fafc),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.primaryColor,
        leading: IconButton(
          icon: Icon(
            LucideIcons.chevronLeft,
            color: AppTheme.whiteColor,
            size: 20.w,
          ),
          onPressed: () {
            Get.offAllNamed(AppRoutes.homePage);
            controller.indentData.value = null;
          },
        ),
        title: Text(
          'Indent Details',
          style: TextStyle(
            color: AppTheme.whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (!didPop) {
            Get.offAllNamed(AppRoutes.homePage);
          }
        },
        child: Obx(() {
          final indent = controller.indentData.value;
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (indent == null) {
            return const Center(child: Text("No indent data found"));
          }

          return Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                // Header with Status
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    gradient: AppTheme.primaryGradient,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primaryColor.withOpacity(0.25),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        LucideIcons.fileText,
                        color: Colors.white,
                        size: 18.w,
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          indent.indentId ?? "N/A",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          indent.indentStatus?.toUpperCase() ?? "N/A",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16.h),

                // Details Grid
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 12,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: buildCompactField(
                                    "Requestor",
                                    indent.requesterName ?? "N/A",
                                    LucideIcons.user,
                                    const Color(0xff3b82f6),
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: buildCompactField(
                                    "Date",
                                    indent.dateOfIndent ?? "N/A",
                                    LucideIcons.calendar,
                                    const Color(0xff10b981),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),

                            buildCompactField(
                              "Department",
                              indent.deptLab ?? "N/A",
                              LucideIcons.building,
                              const Color(0xff8b5cf6),
                            ),
                            SizedBox(height: 12.h),

                            Row(
                              children: [
                                Expanded(
                                  child: buildCompactField(
                                    "Net Total",
                                    indent.netTotal != null
                                        ? "₹${indent.netTotal}"
                                        : "N/A",
                                    LucideIcons.indianRupee,
                                    const Color(0xfff59e0b),
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: buildCompactField(
                                    "Status",
                                    indent.indentStatus ?? "N/A",
                                    LucideIcons.circleCheck,
                                    const Color(0xff10b981),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        controller.regfirstStep.value == true &&
                                controller.userMail.value ==
                                    "registraroffice@amrita.edu"
                            ? InkWell(
                                onTap: () {
                                  controller.registerIn(
                                    controller.scannedValue.value,
                                  );
                                  controller.buttonSubmit(context);
                                },
                                child: DoneBtn(btnText: 'Register In'),
                              )
                            : Container(),

                        // this button is used for purchase user
                        (controller.indentData.value?.indentStatus !=
                                    "PO Released" &&
                                controller.indentData.value?.indentStatus !=
                                    "Submitted" &&
                                controller.indentData.value?.indentStatus !=
                                    "Registrar In" &&
                                controller.purchaseFirstStep.value == true &&
                                controller.userMail.value ==
                                    "purchaseteam@amrita.edu" &&
                                controller.indentData.value?.indentStatus !=
                                    "Purchase In" &&
                                controller.indentData.value?.indentStatus !=
                                    "Rejected" &&
                                controller.indentData.value?.indentStatus !=
                                    "Returned")
                            ? InkWell(
                                onTap: () {
                                  controller.purchaseIn(
                                    controller.scannedValue.value,
                                  );
                                  controller.purchaseDone(context);
                                },
                                child: DoneBtn(btnText: 'Purchase In'),
                              )
                            : const SizedBox.shrink(),

                        // this button is used for purchase user
                        // this button is used for purchase user
                        (controller.indentData.value?.indentStatus !=
                                    "PO Released") &&
                                controller.indentData.value?.indentStatus !=
                                    "Submitted" &&
                                controller.indentData.value?.indentStatus !=
                                    "Registrar In" &&
                                controller.purchaseFirstStep.value == true &&
                                controller.userMail.value ==
                                    "purchaseteam@amrita.edu" &&
                                controller.indentData.value?.indentStatus ==
                                    "Purchase In" &&
                                controller.indentData.value?.indentStatus !=
                                    "Rejected" &&
                                controller.indentData.value?.indentStatus !=
                                    "Returned"
                            ? InkWell(
                                onTap: () {
                                  controller.poReleased(
                                    controller.scannedValue.value,
                                  );
                                  controller.poPurchaseDone(context);
                                },
                                child: DoneBtn(btnText: 'PO Released'),
                              )
                            : Container(),

                        // this button is used for purchase user
                        controller.regSecondStep == true
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.approve(context);
                                      controller.afterRegisterIn(
                                        controller.scannedValue.value,
                                        'Registrar Approved',
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 10.w,
                                      ),
                                      decoration: BoxDecoration(
                                        // gradient: AppTheme.primaryGradient,
                                        color: AppTheme.successColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(16),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            LucideIcons.circleCheck,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          SizedBox(width: 10.w),
                                          Text(
                                            'Approve',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.rejected(context);
                                      controller.afterRegisterIn(
                                        controller.scannedValue.value,
                                        'Rejected',
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 10.w,
                                      ),
                                      decoration: BoxDecoration(
                                        // gradient: AppTheme.primaryGradient,
                                        color: AppTheme.dangerColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(16),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            LucideIcons.circleX,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          SizedBox(width: 10.w),
                                          Text(
                                            'Reject',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.returned(context);
                                      controller.afterRegisterIn(
                                        controller.scannedValue.value,
                                        'Returned',
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 10.w,
                                      ),
                                      decoration: BoxDecoration(
                                        gradient: AppTheme.primaryGradient,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(16),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            LucideIcons.circleCheck,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          SizedBox(width: 10.w),
                                          Text(
                                            'Returned',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 16.h),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget buildCompactField(
    String label,
    String value,
    IconData icon,
    Color iconColor,
  ) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: const Color(0xfff8fafc),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.shade200, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Icon(icon, color: iconColor, size: 12.w),
              ),
              SizedBox(width: 6.w),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
