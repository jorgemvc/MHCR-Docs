# @file    ArchivosMH43.ps1
# @author  Jorge Villalobos Carvajal (jorgemvc@gmail.com)
# @date    11.Jun.2020
# @version 1.2 
#  
# @brief   Automatización de la descarga de todos los archivos del Ministerio de Hacienda
#

# ----
# Constantes con las direcciones de fuente y destino de los archivos a descargar
#
$haciendaUrl = "https://www.hacienda.go.cr/ATV/ComprobanteElectronico/docs/esquemas/2016/v4.3/"
$localDir = "C:\\Temporal\\Hacienda\\v43\\"

  function Download-File {
    param( [string]$Archivo )

    invoke-webrequest -uri "$($haciendaUrl)$($Archivo)" -outfile "$($localDir)$($Archivo)"
  }  # Download-File

  function GenerateFolder($path){
    $global:foldPath=$null
    foreach ($foldername in $path.split("\")) {
      $global:foldPath+=($foldername+"\")
        if (!(Test-Path $global:foldPath)) {
          New-Item -ItemType Directory -Path $global:foldPath | Out-Null
          # Write-Host "$global:foldPath Folder Created Successfully"
        }
    }   
  }  # GenerateFolder

Write-Host "Script: ArchivosMH43.ps1 - v1.2"
Write-Host "  Por Jorge VC - Jun.2020"
Write-Host ""

Write-Host "Verificando el directorio de descarga"
GenerateFolder $localDir

Write-Host -NoNewline "Descargando archivos XSD/DOC "

Download-File "MensajeHacienda_V4.3.xsd"
Write-Host -NoNewline "."
Download-File "MensajeHacienda_V4.3.doc"
Write-Host -NoNewline "."

Download-File "FacturaElectronica_V4.3.xsd"
Write-Host -NoNewline "."
Download-File "FacturaElectronica_V4.3.doc"
Write-Host -NoNewline "."

Download-File "MensajeReceptor_V4.3.xsd"
Write-Host -NoNewline "."
Download-File "MensajeReceptor_V4.3.doc"
Write-Host -NoNewline "."

Download-File "NotaCreditoElectronica_V4.3.xsd"
Write-Host -NoNewline "."
Download-File "NotaCreditoElectronica_V4.3.doc"
Write-Host -NoNewline "."

Download-File "NotaDebitoElectronica_V4.3.xsd"
Write-Host -NoNewline "."
Download-File "NotaDebitoElectronica_V4.3.doc"
Write-Host -NoNewline "."

Download-File "TiqueteElectronico_V4.3.xsd"
Write-Host -NoNewline "."
Download-File "TiqueteElectronico_V4.3.doc"
Write-Host -NoNewline "."

Download-File "FacturaElectronicaCompra_V4.3.xsd"
Write-Host -NoNewline "."
Download-File "FacturaElectronicaCompra_V4.3.doc"
Write-Host -NoNewline "."

Download-File "FacturaElectronicaExportacion_V4.3.xsd"
Write-Host -NoNewline "."
Download-File "FacturaElectronicaExportacion_V4.3.doc"
Write-Host -NoNewline "."

Write-Host ""
Write-Host -NoNewline "Descargando archivos PDF/RAR "

# Documentos PDF
Download-File "Guia_IdP.pdf"
Write-Host -NoNewline "."
Download-File "ANEXOS Y ESTRUCTURAS_V4.3.pdf"
Write-Host -NoNewline "."
Download-File "Resolución_General_sobre_disposiciones_técnicas_comprobantes_electrónicos_para_efectos_tributarios.pdf"
Write-Host -NoNewline "."
Download-File "REGLAMENTO_DE_COMPROBANTES_ELECTRONICOS.pdf"
Write-Host -NoNewline "."
Download-File "Codigodemoneda_V4.3.pdf"
Write-Host -NoNewline "."

# Archivo .RAR
Download-File "Codificacionubicacion_V4.3.rar"
Write-Host -NoNewline ".    Listo."
