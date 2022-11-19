<template>
  <PageWrapper dense contentFullHeight fixedHeight contentClass="flex">
    <DeptTree class="w-1/4 xl:w-1/7" @select="handleSelect" />
    <BasicTable @register="registerTable" class="w-3/4 xl:w-4/5" :searchInfo="searchInfo">
      <template #toolbar>
        <a-button type="primary" @click="handleCreate">新增账号</a-button>
      </template>
      <template #action="{ record }">
        <TableAction
          :actions="[
            {
              icon: 'ant-design:eye-outlined',
              tooltip: '查看用户详情',
              onClick: handleView.bind(null, record),
            },
            {
              icon: 'clarity:note-edit-line',
              tooltip: '编辑用户资料',
              onClick: handleEdit.bind(null, record),
            },
            {
              icon: 'ant-design:retweet-outlined',
              tooltip: '重置密码',
              popConfirm: {
                title: '是否确认重置密码',
                confirm: handleResetPassword.bind(null, record)
              }
            },
            {
              icon: 'ant-design:delete-outlined',
              color: 'error',
              tooltip: '删除此账号',
              popConfirm: {
                title: '是否确认删除',
                confirm: handleDelete.bind(null, record),
              },
            },
          ]"
        />
      </template>
    </BasicTable>
    <UserDetailDrawer @register="registerDetailDrawer" />
    <UserModal @register="registerModal" @success="handleSuccess" />
  </PageWrapper>
</template>
<script lang="ts">
import { defineComponent, reactive } from 'vue';

import { BasicTable, useTable, TableAction } from '/@/components/Table';

import { getUserList, deleteUser, resetPassword } from '/@/api/sys/user';
import { PageWrapper } from '/@/components/Page';
import DeptTree from './DeptTree.vue';

import { useModal } from '/@/components/Modal';
import UserModal from './UserModal.vue';
import UserDetailDrawer from './UserDetail.vue';

import { useDrawer } from '/@/components/Drawer';
import { columns, searchFormSchema } from './user.data';
import {useMessage} from "/@/hooks/web/useMessage";

export default defineComponent({
  name: 'UserManagement',
  components: { BasicTable, PageWrapper, DeptTree, UserModal, UserDetailDrawer, TableAction },
  setup() {
    const { createMessage } = useMessage();
    const [registerDetailDrawer, { openDrawer: openDetailDrawer }] = useDrawer();
    const [registerModal, { openModal }] = useModal();
    const searchInfo = reactive<Recordable>({});
    const [registerTable, { reload }] = useTable({
      title: '用户列表',
      api: getUserList,
      rowKey: 'id',
      columns,
      formConfig: {
        labelWidth: 120,
        schemas: searchFormSchema,
        autoSubmitOnEnter: true,
      },
      useSearchForm: true,
      showTableSetting: true,
      bordered: true,
      handleSearchInfoFn(info) {
        return info;
      },
      actionColumn: {
        width: 160,
        title: '操作',
        dataIndex: 'action',
        slots: { customRender: 'action' },
      },
    });

    function handleCreate() {
      openModal(true, {
        isUpdate: false,
      });
    }

    function handleEdit(record: Recordable) {
      openModal(true, {
        record,
        isUpdate: true,
      });
    }

    async function handleResetPassword(record: Recordable) {
      const result = await resetPassword(record);
      if (result) {
        createMessage.success('重置成功');
        await reload();
      }
    }

    async function handleDelete(record: Recordable) {
      await deleteUser(record.id);
      await reload();
    }

    function handleSuccess() {
      reload();
    }

    function handleSelect(deptId = '') {
      searchInfo.deptId = deptId;
      reload();
    }

    function handleView(record: Recordable) {
      openDetailDrawer(true, { record });
    }

    return {
      registerTable,
      registerModal,
      registerDetailDrawer,
      handleCreate,
      handleEdit,
      handleResetPassword,
      handleDelete,
      handleSuccess,
      handleSelect,
      handleView,
      searchInfo,
    };
  },
});
</script>