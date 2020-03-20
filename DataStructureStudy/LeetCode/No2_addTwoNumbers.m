//
//  No2_addTwoNumbers.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2020/3/19.
//  Copyright © 2020 jolin. All rights reserved.
//

#import "No2_addTwoNumbers.h"
#import "StructureDefine.h"

@implementation No2_addTwoNumbers

- (instancetype)init
{
    if (self = [super init]) {
        
        testTwoNumbersAdd();
        
        testTwoNumbersReverseAdd();
    }
    return self;
}

void testTwoNumbersAdd()
{
    int array1[] = {2, 4, 7, 9};
    int size = sizeof(array1) / sizeof(array1[0]);
    ListNode * head1 = nodeFromArray(array1, size);
    
    int array2[] = {5, 6, 4};
    size = sizeof(array2) / sizeof(array2[0]);
    ListNode * head2 = nodeFromArray(array2, size);
    
    ListNode * sum = addTwoNumbers(head1, head2);
    printf("\n------------- No2_addTwoNumbers ------------\n\n");
    printListNode(head1);
    printf(" + ");
    printListNode(head2);
    printf(" = ");
    printListNode(sum);
    printf("\n");
}


ListNode * addTwoNumbers(ListNode * head1, ListNode * head2)
{
    if (!head1) return head2;
    if (!head2) return head1;
    ListNode * p1 = head1;
    ListNode * p2 = head2;
    ListNode * result = NULL;
    ListNode * p3 = NULL;
    int carry = 0;
    
    while (p1 || p2) {
        int value1 = p1 ? p1->value : 0;
        int value2 = p2 ? p2->value : 0;
        int sum = value1 + value2 + carry;
        if (sum >= 10) {
            carry = 1;
            sum %= 10;
        }
        else {
            carry = 0;
        }
        ListNode * node = nodeFromValue(sum);
        if (!result) {
            result = node;
            p3 = node;
        }
        else {
            p3->next = node;
            p3 = p3->next;
        }
        p1 ? p1 = p1->next : 0;
        p2 ? p2 = p2->next : 0;
    }
    if (carry > 0) {
        ListNode * node = nodeFromValue(carry);
        p3->next = node;
    }
    
    return result;
}

#pragma mark - 反向链表相加
void testTwoNumbersReverseAdd()
{
    int array1[] = {5, 4, 4, 3};
    int size = sizeof(array1) / sizeof(array1[0]);
    ListNode * head1 = nodeFromArray(array1, size);
    
    int array2[] = {5, 6, 4};
    size = sizeof(array2) / sizeof(array2[0]);
    ListNode * head2 = nodeFromArray(array2, size);
    
    ListNode * sum = addTwoReverseNumbers(head1, head2);
    printf("\nreverse:\n");
    printListNode(head1);
    printf(" + ");
    printListNode(head2);
    printf(" = ");
    printListNode(sum);
    printf("\n");
    
}



ListNode * addTwoReverseNumbers(ListNode * head1, ListNode * head2)
{
    if (!head1) return head2;
    if (!head2) return head1;
    
    ListNode * p1 = head1;
    ListNode * p2 = head2;
    int n = 0, m = 0;
    // 分别获取两个链表的长度
    while (p1) { n++; p1 = p1->next; }
    while (p2) { m++; p2 = p2->next; }
    // 将短的链表补到和长的一样长
    ListNode * dumpHead = NULL;
    ListNode * p3 = NULL;
    int gap = abs(m - n);
    for (int i = 0; i < gap; i ++) {
        if (!dumpHead) {
            dumpHead = nodeFromValue(0);
            p3 = dumpHead;
        }
        else {
            ListNode * node = nodeFromValue(0);
            p3->next = node;
            p3 = p3->next;
        }
    }
    // 计算和
    ListNode * head = NULL;
    int carry = 0;
    if (n < m) {
        p3->next = head1;
        head = resultNode(dumpHead, head2, &carry);
    }
    else if (n > m) {
        p3->next = head2;
        head = resultNode(head1, dumpHead, &carry);
    }
    else {
        head = resultNode(head1, head2, &carry);
    }
    // 最后还存在进位的情况下，更新首节点
    if (carry > 0) {
        ListNode * node = nodeFromValue(carry);
        node->next = head;
        return node;
    }
    
    return head;
}

ListNode * resultNode(ListNode * head1, ListNode * head2, int * carry)
{
    if (!head1 && !head2) return NULL;
    
    ListNode * head = resultNode(head1->next, head2->next, carry);
    
    int value1 = head1->value;
    int value2 = head2->value;
    int sum = value1 + value2 + *carry;
    ListNode * node = nodeFromValue(sum % 10);
    *carry = sum /= 10;
    node->next = head;
    return node;
}

@end
