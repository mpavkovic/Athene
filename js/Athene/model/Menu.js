Ext.define('Athene.model.Menu', {
    extend: 'Ext.data.Model',
    proxy: {
        type: 'direct',
        api: {
            create: Menu.create,
            read: Menu.read,
            update: Menu.update,
            destroy: Menu.destroy
        },
        reader: {
            root: 'data'
        }
    },
    fields: [
        'id',
        'label',
        'ext_id',
        'ext_cls',
        'ext_leaf',
        'ext_expanded',
        'ext_iconCls',
        'parent'
    ],
    belongsTo: 'Athene.model.User'
});