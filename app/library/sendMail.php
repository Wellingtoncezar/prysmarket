<?php
if(!defined('BASEPATH')) die('Acesso não permitido');
class sendMail extends Library{

	public function send($para, $assunto, $mensagem)
	{
		$corpo = utf8_decode($mensagem);
		$mail = new PHPMailer(); // instancia a classe PHPMailer
		$mail->IsSMTP();

		//configuração do gmail
		$mail->Port = '465'; //porta usada pelo gmail.
		$mail->Host = 'smtp.gmail.com'; 
		$mail->IsHTML(true); 
		$mail->Mailer = 'smtp'; 
		$mail->SMTPSecure = 'ssl';

		//configuração do usuário do gmail
		$mail->SMTPAuth = true;
		$mail->Username = 'prysmarket@gmail.com'; // usuario gmail.   
		$mail->Password = 'prysmarket123'; // senha do email.

		$mail->SingleTo = true; 

		// configuração do email a ver enviado.
		$mail->From = "prysmarket@gmail.com";
		$mail->FromName = "Prysmarket";

		$mail->addAddress($para); // email do destinatario.

		$mail->Subject = utf8_decode($assunto); 
		$mail->Body = $corpo;

		$mail->IsHTML(true); 
		if(!$mail->Send())
		    return "Erro ao enviar Email:" . $mail->ErrorInfo;
	}

}