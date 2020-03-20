//
//  No2_addTwoNumbers.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2020/3/19.
//  Copyright © 2020 jolin. All rights reserved.
//

#import "No2_addTwoNumbers.h"
#import "StructureDefine.h"
#import "PrintDefine.h"

@implementation No2_addTwoNumbers

- (instancetype)init
{
    if (self = [super init]) {
        
        testTwoNumbersAdd();
        
        testTwoNumbersReverseAdd();
        
        testTwoIntegerAdd();
        
        testTwoStringAdd();
        
        testAddIntergerInArrayForm();
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
    
    while (p1 || p2 || carry) {
        int value1 = p1 ? p1->value : 0;
        int value2 = p2 ? p2->value : 0;
        int sum = value1 + value2 + carry;
        ListNode * node = nodeFromValue(sum % 10);
        carry = sum / 10;
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
    printf("reverse:\n");
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
    *carry = sum / 10;
    node->next = head;
    return node;
}

#pragma mark - 两数相加
void testTwoIntegerAdd()
{
    int a = 1, b = -3;
    int sum = addTwoIntegers(a, b);
    printf("integer : %d + %d = %d\n", a, b, sum);
}

int addTwoIntegers(int a, int b)
{
    return b == 0 ? a : addTwoIntegers( a ^ b, (a & b) << 1);
}


void testTwoStringAdd()
{
    char * num1 = "99345";
    char * num2 = "756";
    char * sum = addTwoString(num1, num2);
    printf("string : %s + %s = %s\n", num1, num2, sum);
}

char * addTwoString(char * num1, char * num2)
{
    if (!num1) return num2;
    if (!num2) return num1;
    // 分别计算 num1 和 num2 的长度
    char * p1 = num1, * p2 = num2;
    int n = 0, m = 0;
    while (*p1++ != '\0') n++;
    while (*p2++ != '\0') m++;
    
    int sum = 0;
    int maxSize = MAX(m, n);
    char * result = malloc(sizeof(char) * (maxSize + 1));
    memset(result, 0, maxSize + 1);
    int k = maxSize - 1;
    int i = n - 1, j = m - 1;
    // 从后往前遍历 num1 和 num2，并对结果赋值到新的字符串
    while (i >= 0 || j >= 0) {
        if (i >= 0) sum += num1[i--] - '0';
        if (j >= 0) sum += num2[j--] - '0';
        result[k--] = sum % 10 + '0';
        sum /= 10;
    }
    // 处理进位
    if (sum > 0) {
        char * newResult = malloc(maxSize + 2);
        memcpy(newResult + 1, result, maxSize + 1);
        newResult[0] = sum + '0';
        return newResult;
    }
    return result;
}

void testAddIntergerInArrayForm()
{
    int array[] = {9, 9, 1, 2};
    int size = sizeof(array) / sizeof(array[0]);
    
    int k = 98;
    int returnSize = 0;
    int * result = addIntergerInArrayForm(array, size, k, &returnSize);
    printf("arrayForm: ");
    printArray(result, returnSize);
}

int * addIntergerInArrayForm(int * array, int size, int k, int * returnSize)
{
    if (!array || size <= 0 || !returnSize) return NULL;
    int j = 0;
    int m = k;
    while (m) { m /= 10; j++;}
    
    int i = size - 1;
    int maxSize = j > size ? j : size;
    int * result = malloc(sizeof(int) * maxSize);
    int sum = 0;
    m = maxSize;
    // 从后往前遍历 num1 和 num2，并对结果赋值到新的字符串
    while (i >= 0 || k > 0) {
        if (i >= 0) sum += array[i--];
        if (k > 0) sum += k % 10;
        result[m - 1] = sum % 10;
        sum /= 10;
        k /= 10;
        m --;
    }
    // 处理进位
    if (sum) {
        int * newResult = malloc(sizeof(int) * (maxSize + 1));
        memcpy(newResult + 1, result, maxSize * sizeof(int));
        newResult[0] = sum;
        *returnSize = maxSize + 1;
        return newResult;
    }
    *returnSize = maxSize;
    return result;
}

@end
