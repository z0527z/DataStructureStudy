//
//  BinaryTreePaths.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2021/1/11.
//  Copyright © 2021 jolin. All rights reserved.
//

#import "BinaryTreePaths.h"
#import "StructureDefine.h"
#import "DJStack.h"

@implementation BinaryTreePaths

- (instancetype)init {
    if (self = [super init]) {
        
        /*
                        1
                      /   \
                     2     3
                    / \
                   4   5
                  / \
                 6   7

         */
        
        TreeNode * tree = malloc(sizeof(TreeNode));
        tree->value = 1;
        
        TreeNode * left1 = malloc(sizeof(TreeNode));
        left1->value = 2;
        left1->pLeft = NULL;
        tree->pLeft = left1;

        TreeNode * right1 = malloc(sizeof(TreeNode));
        right1->value = 3;
        right1->pLeft = NULL;
        right1->pRight = NULL;
        tree->pRight = right1;

        TreeNode * left2 = malloc(sizeof(TreeNode));
        left2->value = 4;
        left1->pLeft = left2;

        TreeNode * right2 = malloc(sizeof(TreeNode));
        right2->value = 5;
        right2->pLeft = NULL;
        right2->pRight = NULL;
        left1->pRight = right2;

        TreeNode * left3 = malloc(sizeof(TreeNode));
        left3->value = 6;
        left3->pLeft = NULL;
        left3->pRight = NULL;
        left2->pLeft = left3;

        TreeNode * right3 = malloc(sizeof(TreeNode));
        right3->value = 7;
        right3->pLeft = NULL;
        right3->pRight = NULL;
        left2->pRight = right3;
        
        int size = 0;
        char ** paths = recursiveAllPathsForBinaryTree(tree, &size);
        printf("\n------------- BinaryTreePaths ------------\n\n");
        
        if (paths) {
            printf("path: ");
            for (int i = 0; i < size; i ++) {
                char * path = paths[i];
                i == size - 1 ? printf("%s", path) : printf("%s, ", path);
                free(path);
            }
            printf("\n");
            free(paths);
        }
    }
    return self;
}

#pragma mark - 迭代实现
/**
 * 采用前序遍历迭代，所以只需要回溯叶子节点
 */
char ** nonRecursiveAllPathsForBinaryTree(TreeNode * tree, int * returnSize) {
    if (!tree) return NULL;
    
    // 获取树的深度
    int depth = getDepthOfBinaryTree(tree);
    char ** paths = malloc(sizeof(char *) * pow(2, depth));
    char tmpBuf[100] = {0}; // 存储临时路径的数组
    int bufIdx = 0;
    
    DJStack * stack = [[DJStack alloc] init];
    [stack push:tree];
    
    
    while (!stack.empty) {
        TreeNode * node = stack.pop;
        
        if (node->pLeft == NULL && node->pRight == NULL) {
            // 保留叶子节点之前的值用于回溯
            int oldBufIdex = bufIdx;
            // 叶子节点添加路径
            bufIdx += sprintf(tmpBuf + bufIdx, "%d", node->value);
            
            // 申请路径字符串空间，并赋值
            char * path = malloc(sizeof(char) * (bufIdx + 1));
            strncpy(path, tmpBuf, bufIdx);
            path[bufIdx] = '\0';
            // 拷贝路径字符串到路径数组，并更新数量
            *(paths + *returnSize) = path;
            (*returnSize) ++;
            // 回溯路径
            bufIdx = oldBufIdex;
        }
        else {
            // 非叶子节点添加路径
            bufIdx += sprintf(tmpBuf + bufIdx, "%d->", node->value);
            
            if (node->pLeft) {
                [stack push:node->pLeft];
            }
            if (node->pRight) {
                [stack push:node->pRight];
            }
        }
    }
    return paths;
}

#pragma mark - 递归实现
char ** recursiveAllPathsForBinaryTree(TreeNode * tree, int * returnSize) {
    if (!tree) return NULL;
    
    int depth = getDepthOfBinaryTree(tree);
    char ** paths = malloc(sizeof(char *) * pow(2, depth));
    int pathIdx = 0;
    char buf[100] = {0};
    int bufIdx = 0;
    
    travelPath(tree, paths, buf, &bufIdx, returnSize);
    
    return paths;
}

/**
 * 递归实现时每个节点都需要回溯
 */
void travelPath(TreeNode * tree, char ** paths, char * buf, int * bufIdx, int * returnSize) {
    // 保留叶子节点之前的值用于回溯
    int oldIdx = *bufIdx;
    
    if (tree->pLeft == NULL && tree->pRight == NULL) {
        // 叶子节点添加路径
        *bufIdx += sprintf(buf + *bufIdx, "%d", tree->value);
        // 申请路径字符串空间，并赋值
        char * path = malloc(sizeof(char) * (*bufIdx + 1));
        strncpy(path, buf, *bufIdx + 1);
        path[*bufIdx] = '\0';
        // 拷贝路径字符串到路径数组，并更新数量
        *(paths + *returnSize) = path;
        (*returnSize)++;
        // 叶子节点回溯路径
        *bufIdx = oldIdx;
    }
    else {
        // 非叶子节点添加路径
        *bufIdx += sprintf(buf + *bufIdx, "%d->", tree->value);
        // 遍历左树
        if (tree->pLeft) {
            travelPath(tree->pLeft, paths, buf, bufIdx, returnSize);
        }
        // 遍历右树
        if (tree->pRight) {
            travelPath(tree->pRight, paths, buf, bufIdx, returnSize);
        }
        // 非叶子节点回溯路径
        *bufIdx = oldIdx;
    }
}


#pragma mark - 通用方法
/**
 * 返回树的深度
 */
int getDepthOfBinaryTree(TreeNode * tree) {
    if (!tree) return 0;
    
    return 1 + MAX(getDepthOfBinaryTree(tree->pLeft), getDepthOfBinaryTree(tree->pRight));
}


@end
