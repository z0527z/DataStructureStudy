//
//  CyclePositionInList.m
//  MyStudy
//
//  Created by jolin on 2019/11/3.
//  Copyright © 2019年 jolin. All rights reserved.
//

#import "CyclePositionInList.h"
#import "StructureDefine.h"

@implementation CyclePositionInList

- (instancetype)init
{
    if (self = [super init]) {
        
        ListNode * head = malloc(sizeof(ListNode));
        head->value = 0;
        
        ListNode * first = malloc(sizeof(ListNode));
        first->value = 1;
        head->next = first;
        
        ListNode * second = malloc(sizeof(ListNode));
        second->value = 2;
        first->next = second;
        
        ListNode * third = malloc(sizeof(ListNode));
        third->value = 3;
        second->next = third;
        
        ListNode * fourth = malloc(sizeof(ListNode));
        fourth->value = 4;
        third->next = fourth;
        
        ListNode * fifth = malloc(sizeof(ListNode));
        fifth->value = 5;
        fourth->next = fifth;
        
        fifth->next = first;
        
        ListNode * cycleStart = cyclePostionInList(head);
        printf("\n------------- CyclePositionInList -----------\n\n");
        printf("%d\n", cycleStart->value);
    }
    return self;
}

/**
 面试题23：链表中环的入口节点
 
 如果一个链表中包含环，如何找出环的入口节点

 @param head 链表头结点
 @return 环的入口节点
 */
ListNode * cyclePostionInList(ListNode * head)
{
    if (!head || !head->next) return NULL;
    
    ListNode * firstPtr = head;
    ListNode * secondPtr = head;
    bool isCycled = false;
    
    // 查找是否有环，使用一块一慢两个指针，检测是否相交
    while (firstPtr && secondPtr) {
        firstPtr = firstPtr->next;
        if (!secondPtr->next->next) return NULL;
        secondPtr = secondPtr->next->next;
        if (firstPtr == secondPtr) {
            isCycled = true;
            break;
        }
    }
    // 没有成环
    if (!isCycled) return NULL;
    // 快指针追上慢指针的位置与环起点之间的距离 == 链表头距离环起点的位置
    firstPtr = head;
    while (firstPtr != secondPtr) {
        firstPtr = firstPtr->next;
        secondPtr = secondPtr->next;
    }
    
    return firstPtr;
    
}

@end
