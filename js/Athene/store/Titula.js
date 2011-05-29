Ext.define('Athene.store.Titula', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Titula',
    proxy: {
        type: 'direct',
        directFn: Titula.getAll,
        reader: {
            root: 'data'
        }
    },
    sorters: [
        {
            property: 'naziv',
            property: 'tip'
        }
    ]
});