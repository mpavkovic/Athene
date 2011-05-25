Ext.define('Athene.store.Ucitelj', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Ucitelj',
    proxy: {
        type: 'direct',
        directFn: Ucitelj.getAll
    },
    sorters: [
        {
            property: 'prezime'
        }
    ]
});