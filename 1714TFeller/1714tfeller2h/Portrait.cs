//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace _1714tfeller2h
{
    using System;
    using System.Collections.Generic;
    
    public partial class Portrait
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Portrait()
        {
            this.Reciepts = new HashSet<Reciept>();
        }
    
        public int Id { get; set; }
        public string portRatio { get; set; }
        public decimal portCost { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Reciept> Reciepts { get; set; }
    }
}
