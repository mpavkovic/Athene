Ext.define('Athene.model.Group', {
    extend: 'Ext.data.Model',
    fields: [
        'id',
        'name'
    ],
    proxy: {
        type: 'direct',
        api: {
            create: Group.create,
            read: Group.read,
            update: Group.update,
            destroy: Group.destroy
        },
        reader: {
            root: 'data'
        }
    },
});