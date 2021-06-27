using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Smart_Shop.Models
{
    public class ResetPasswordModel
    {
        [Key]
        [Required(ErrorMessage ="Yêu cầu mật khẩu mới", AllowEmptyStrings =false)]
        [DataType(DataType.Password)]
        [Display(Name ="Mật khẩu mới")]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Compare("NewPassword" , ErrorMessage ="Mật khẩu mới và mật khẩu xác nhận không trùng nhau")]
        [Display(Name = "Xác nhận mật khẩu mới")]
        public string ConfirmPassword { get; set; }

        public string ResetCode { get; set; }
    }
}