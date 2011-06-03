Ext.define('Athene.model.Tip', {
    extend: 'Ext.data.Model',
    proxy: {
        type: 'direct',
        api: {
            create: Tip.read
        },
        reader: {
            root: 'data'
        }
    },
    fields: [
        'id',
        'title',
        'content',
    ]
});