Ext.define('Athene.model.Mjesto', {
    extend: 'Ext.data.Model',
    proxy: {
        type: 'direct',
        api: {
            create: Mjesto.save,
            read: Mjesto.getAll,
            update: Mjesto.update,
            destroy: Mjesto.del
        },
        reader: {
            root: 'data'
        }
    },
    fields: [
        'id',
        'naziv',
        'drzava_id',
        'drzava',
        'post_br'
    ],
    belongsTo: 'Drzava'
});