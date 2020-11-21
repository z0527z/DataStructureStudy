//
//  main.m
//  MyStudy
//
//  Created by jolin on 2019/9/30.
//  Copyright © 2019年 jolin. All rights reserved.
//

#import <mach-o/dyld.h>
#import <Foundation/Foundation.h>
#import "FindNumIn2DArray.h"
#import "ReplaceBlank.h"
#import "PrintListFromTail.h"
#import "preInOrderRebuildBinaryTree.h"
#import "QuickSort.h"
#import "HeapSort.h"
#import "MergeSort.h"
#import "SelectSort.h"
#import "InsertSort.h"
#import "Fibonacci.h"
#import "BinaryDigitalCount.h"
#import "DeleteListNodeInConstantTime.h"
#import "ReorderOddEven.h"
#import "OutputKthNodeToTail.h"
#import "ReverseList.h"
#import "MergeTwoListToOne.h"
#import "HasSubTree.h"
#import "MirrorOfBinaryTree.h"
#import "RemoveRepeatListNode.h"
#import "HasPathInMatrix.h"
#import "DuplicateNumInArray.h"
#import "NextNodeInBinaryTree.h"
#import "CountSort.h"
#import "CutRopeForGreatestProduct.h"
#import "CyclePositionInList.h"
#import "FindFirstCommonNode.h"
#import "IsSymmetryTree.h"
#import "No7_reverseInteger.h"
#import "No9_palindromicNumber.h"
#import "No26_deleteDuplicateInOrderedArray.h"
#import "No4_medianOfTwoSortedArray.h"
#import "No2_addTwoNumbers.h"
#import "FindKthNumInArray.h"
#import "No3_findLongestSubStringWithoutRepeating.h"
#import "FindLowestCommonAncestor.h"
#import "FindTreePathEqualToAnInteger.h"
#import "RegexMatch.h"
#import "FindMinNumInRotateArray.h"
#import "RepeatedSubStrPattern.h"
#import "No5_LongestPalindromicSubstring.h"
#import "No8_StringToInteger.h"
#import "No14_LongestCommonPrefixInArray.h"

void testLeetCodeProblems()
{
    No7_reverseInteger * reverseInteger = [[No7_reverseInteger alloc] init];
    No9_palindromicNumber * palindromicNumber = [[No9_palindromicNumber alloc] init];
    No26_deleteDuplicateInOrderedArray * deleteDuplicate = [[No26_deleteDuplicateInOrderedArray alloc] init];
    No4_medianOfTwoSortedArray * medianOfTwoSortedArray = [[No4_medianOfTwoSortedArray alloc] init];
    No2_addTwoNumbers * addTwoNumbers = [[No2_addTwoNumbers alloc] init];
    No3_findLongestSubStringWithoutRepeating * findLonggestSubString = [[No3_findLongestSubStringWithoutRepeating alloc] init];
    No5_LongestPalindromicSubstring * longgestPalindromicSubString = [[No5_LongestPalindromicSubstring alloc] init];
    No8_StringToInteger * stringToInteger = [[No8_StringToInteger alloc] init];
    No14_LongestCommonPrefixInArray * longestCommonPrefix = [[No14_LongestCommonPrefixInArray alloc] init];
}

void testCodingInterviews()
{
    FindNumIn2DArray * find = [[FindNumIn2DArray alloc] init];
    ReplaceBlank * replaceBlank = [[ReplaceBlank alloc] init];
    PrintListFromTail * listTail = [[PrintListFromTail alloc] init];
    PreInOrderRebuildBinaryTree  * builBinaryTree = [[PreInOrderRebuildBinaryTree alloc] init];
    QuickSort * quick = [[QuickSort alloc] init];
    HeapSort * heap = [[HeapSort alloc] init];
    MergeSort * merge = [[MergeSort alloc] init];
    SelectSort * select = [[SelectSort alloc] init];
    InsertSort * insert = [[InsertSort alloc] init];
    Fibonacci * fibonacci = [[Fibonacci alloc] init];
    BinaryDigitalCount * binaryDigitalCount = [[BinaryDigitalCount alloc] init];
    DeleteListNodeInConstantTime * deleteListNode = [[DeleteListNodeInConstantTime alloc] init];
    ReorderOddEven * reorderOddEven = [[ReorderOddEven alloc] init];
    OutputKthNodeToTail * outputKthNode = [[OutputKthNodeToTail alloc] init];
    ReverseList * reverseList = [[ReverseList alloc] init];
    MergeTwoListToOne * mergerTwoList = [[MergeTwoListToOne alloc] init];
    HasSubTree * hasSubTree = [[HasSubTree alloc] init];
    MirrorOfBinaryTree * mirrorOfBinaryTree = [[MirrorOfBinaryTree alloc] init];
    RemoveRepeatListNode * removeRepeatListNode = [[RemoveRepeatListNode alloc] init];
    HasPathInMatrix * hasPathInMatrix = [[HasPathInMatrix alloc] init];
    DuplicateNumInArray * duplicateNumInArray = [[DuplicateNumInArray alloc] init];
    NextNodeInBinaryTree * nextNodeInBinaryTree = [[NextNodeInBinaryTree alloc] init];
    CountSort * countSort = [[CountSort alloc] init];
    CutRopeForGreatestProduct * cutRope = [[CutRopeForGreatestProduct alloc] init];
    CyclePositionInList * cyclePostionInList = [[CyclePositionInList alloc] init];
    FindFirstCommonNode * findFirstCommonNode = [[FindFirstCommonNode alloc] init];
    IsSymmetryTree * isSymmetryTree = [[IsSymmetryTree alloc] init];
    FindKthNumInArray * findKthNmberInArray = [[FindKthNumInArray alloc] init];
    FindLowestCommonAncestor * findLowestCommonAncestor = [[FindLowestCommonAncestor alloc] init];
    FindTreePathEqualToAnInteger * findTreePath = [[FindTreePathEqualToAnInteger alloc] init];
    RegexMatch * regexMatch = [[RegexMatch alloc] init];
    FindMinNumInRotateArray * findMinNum = [[FindMinNumInRotateArray alloc] init];
    RepeatedSubStrPattern * repeatedSubStr = [[RepeatedSubStrPattern alloc] init];
    
}

void generalLoadCls() {
    const char * name = _dyld_get_image_name(0);
    char * p = (char *)name;
    printf("%s", p);
}

int main(int argc, const char * argv[]) {

    testCodingInterviews();
    
    testLeetCodeProblems();
    
    generalLoadCls();


    
    printf("\n");
    return 0;
}
