//
//  ReverseList.m
//  MyStudy
//
//  Created by jolin.ding on 2019/10/8.
//  Copyright © 2019 jolin. All rights reserved.
//

#import "ReverseList.h"
#import "StructureDefine.h"

@implementation ReverseList

- (instancetype)init
{
    if (self = [super init]) {
        
        // 构造链表
        ListNode * head = malloc(sizeof(ListNode));
        head->value = 1;
        head->next = NULL;
        ListNode * p = head;
        for (int index = 0; index < 10; index ++) {
            ListNode * temp = malloc(sizeof(ListNode));
            temp->value = index + 2;
            temp->next = NULL;
            p->next = temp;
            p = p->next;
        }
        
//        ListNode * list = reverseWholeList(head);
        ListNode * list = reverseGroupElementForK(head, 3);
        
        printf("\n--------- ReverseList ---------\n\n");
        while (list) {
            printf("%d ", list->value);
            list = list->next;
        }
        printf("\n");
        
    }
    return self;
}


/// 面试题16: 反转链表
///         定义一个函数，输入一个链表的头结点，反转该链表并输出反转后链表的头结点
///
/// @param head 输入链表的头结点
/// @return 返回反转后链表的头结点
ListNode * reverseWholeList(ListNode * head)
{
    ListNode * p = head;
    ListNode * reverseHead = NULL;
    while (p) {
        ListNode * tempNode = p;
        p = p->next;
        tempNode->next = reverseHead;
        reverseHead = tempNode;
    }
    return reverseHead;
}

/// 反转链表变形:
/// 给定一个单链表的头节点head,实现一个调整单链表的函数，使得每K个节点之间为一组进行逆序，并且从链表的尾部开始组起，
/// 头部剩余节点数量不够一组的不需要逆序。（不能使用队列或者栈作为辅助）
/// 例如：链表:   1->2->3->4->5->6->7->8->null, K = 3。那么 6->7->8，3->4->5，1->2 各位一组。
///      调整后: 1->2->5->4->3->8->7->6->null。其中 1，2不调整，因为不够一组。

/// @param head 输入链表的头结点
/// @param k 需要反转的节点区间长度
/// @return 返回调整之后的链表头结点
ListNode * reverseGroupElementForK(ListNode * head, int k)
{
    if (!head || k < 1) return head;
    
    // 获取链表的长度
    int length = 0;
    ListNode * p = head;
    while (p) {
        p = p->next;
        length ++;
    }
    
    if (k > length) {
        return head;
    }
    
    int modelCount = length % k;
    int startIndex = 0;
    ListNode * frontListTail = NULL;
    ListNode * reverseHead = NULL;
    p = head;
    // 链表长度不能被 k 整除，记录 reverseHead 和 frontListTail 的位置
    if (modelCount > 0) {
        reverseHead = p;
        for (int i = 0; i < modelCount; i ++) {
            frontListTail = p;
            p = p->next;
        }
        startIndex += modelCount;
    }
    
    // 分成 k 个一组
    while (startIndex < length) {
        // 局部 k 个长度的数据反转，需要记录反转后的首尾节点指针，用于和前面链表的连接
        ListNode * sectionHeader = NULL;
        ListNode * sectionEnd = p;
        for (int i = 0; i < k; i ++) {
            ListNode * tempNode = p;
            p = p->next;
            tempNode->next = sectionHeader;
            sectionHeader = tempNode;
        }
        // 处理链表不能被 k 整除时，前面的链表和刚刚反转完成的链表连接
        if (frontListTail && reverseHead) {
            frontListTail->next = sectionHeader;
        }
        else {
            // 针对链表长度刚好被 k 整除的情况
            reverseHead = sectionHeader;
            frontListTail = sectionEnd;
        }
        // 更新前面链表的尾节点位置
        frontListTail = sectionEnd;
        startIndex += k;
    }
    return reverseHead;
}

@end
