//
//  No4_medianOfTwoSortedArray.m
//  DataStructureStudy
//
//  Created by jolin on 2020/3/19.
//  Copyright © 2020年 jolin. All rights reserved.
//

#import "No4_medianOfTwoSortedArray.h"
#import "PrintDefine.h"

@implementation No4_medianOfTwoSortedArray

- (instancetype)init
{
    if (self = [super init]) {
        int nums1[] = {1, 3, 4, 8};
        int nums2[] = {3, 4, 5, 6, 7, 8, 9, 10};
        int length1 = sizeof(nums1) / sizeof(nums1[0]);
        int length2 = sizeof(nums2) / sizeof(nums2[0]);
        
        double median = medianOfTwoSortedArray(nums1, length1, nums2, length2);
        
        printf("\n----------- No4_medianOfTwoSortedArray ----------\n\n");
        printf("input: ");
        printArray(nums1, length1);
        printf(",");
        printArray(nums2, length2);
        printf("\noutput: %g\n", median);
        
    }
    return self;
}

double medianOfTwoSortedArray(int * nums1, int length1, int * nums2, int length2)
{
    if ((!nums1 && !nums2) || (length1 <= 0 && length2 <= 0)) return 0;
    
    int left = (length1 + length2 + 1) / 2;
    int right = (length1 + length2 + 2) / 2;
    return (getKth(nums1, 0, length1 - 1, nums2, 0, length2 - 1, left) + getKth(nums1, 0, length1 - 1, nums2, 0, length2 - 1, right)) * 0.5;
}

int getKth(int * nums1, int start1, int end1, int * nums2, int start2, int end2, int k)
{
    int len1 = end1 - start1 + 1;
    int len2 = end2 - start2 + 1;
    // 始终让 len1 < len2
    if (len1 > len2) {
        return getKth(nums2, start2, end2, nums1, start1, end1, k);
    }
    if (len1 == 0) {
        return nums2[start2 + k - 1];
    }
    if (k == 1) {
        return MIN(nums1[start1], nums2[start2]);
    }
    // 递归实现二分查找
    int compareIndex1 = start1 + MIN(len1, k/2) - 1;
    int compareIndex2 = start2 + MIN(len2, k/2) - 1;
    if (nums1[compareIndex1] < nums2[compareIndex2]) {
        return getKth(nums1, compareIndex1 + 1, end1, nums2, start2, end2, k - (compareIndex1 - start1 + 1));
    }
    else {
        return getKth(nums1, start1, end1, nums2, compareIndex2 + 1, end2, k - (compareIndex2 - start2 + 1));
    }
}

@end
