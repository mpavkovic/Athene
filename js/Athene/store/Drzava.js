Ext.define('Athene.store.Drzava', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Drzava',
    proxy: {
        type: 'direct',
        directFn: Drzava.getAll,
        reader: {
            root: 'data'
        }
    },
    sorters: [
        {
            property: 'naziv'
        }
    ]
});