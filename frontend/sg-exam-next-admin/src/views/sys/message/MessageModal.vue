<template>
  <BasicModal v-bind="$attrs" @register="registerModal" :title="getTitle" width="60%" @ok="handleSubmit">
    <BasicForm @register="registerForm">
      <template #remoteSearch="{ model, field }">
        <ApiSelect
          :api="selectUsers"
          showSearch
          v-model:value="model[field]"
          :filterOption="false"
          resultField="list"
          labelField="name"
          valueField="id"
          mode="multiple"
          immediate="true"
          :params="searchParams"
          @search="onSearch"
        />
      </template>
    </BasicForm>
  </BasicModal>
</template>
<script lang="ts">
import {defineComponent, computed, ref, unref} from 'vue';
import { BasicModal, useModalInner } from '/@/components/Modal';
import { BasicForm, useForm, ApiSelect} from '/@/components/Form/index';
import { formSchema } from './message.data';
import {getMessageInfo, createMessage, updateMessage} from '/@/api/sys/message';
import {selectUsers} from "/@/api/sys/message";

export default defineComponent({
  name: 'MessageModal',
  components: { BasicModal, BasicForm, ApiSelect },
  emits: ['success', 'register'],
  setup(_, { emit }) {
    const isUpdate = ref(true);
    let id: string;
    const name = ref<string>('');
    const searchParams = computed<Recordable>(() => {
      return { name: unref(name) };
    });
    const [registerForm, { setFieldsValue, resetFields, validate }] = useForm({
      labelWidth: 100,
      schemas: formSchema,
      showActionButtonGroup: false,
    });
    const [registerModal, { setModalProps, closeModal }] = useModalInner(async (data) => {
      await resetFields();
      id = data.record?.id || null;
      isUpdate.value = !!data?.isUpdate;
      if (unref(isUpdate)) {
        const res = await getMessageInfo(id, {});
        if (res) {
          data.record.receivers = res.receivers;
        }
        await setFieldsValue({
          ...data.record,
        });
      }
      setModalProps({ confirmLoading: false });
    });
    const getTitle = computed(() => '查看');

    async function handleSubmit() {
      try {
        const values = await validate();
        setModalProps({ confirmLoading: true });
        if (id) {
          await updateMessage(id, values);
        } else {
          await createMessage(values);
        }
        closeModal();
        emit('success');
      } finally {
        setModalProps({ confirmLoading: false });
      }
    }

    function onSearch(value: string) {
      name.value = value;
    }

    return {
      searchParams,
      registerModal,
      registerForm,
      getTitle,
      selectUsers,
      onSearch,
      handleSubmit
    };
  },
});
</script>